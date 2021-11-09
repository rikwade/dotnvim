local class = require 'pl.class'
local TestKind = require 'nvim.utils.lsp.java.test-kind'
local Client = require 'nvim.utils.lsp.java.client'
local Promise = require 'promise'
local dap = require 'dap'

local uv = vim.loop

local function get_run_args(testName, launch_args, debug)
    return {
        projectName = launch_args.projectName,
        classPaths = launch_args.classpath,
        mainClass = 'org.eclipse.jdt.internal.junit.runner.RemoteTestRunner',
        args = table.concat(launch_args.programArguments, ' '),
        cwd = launch_args.workingDirectory,

        noDebug = not (debug),
        request = 'launch',
        type = 'java',
        vmArgs = '-ea',
        name = testName,
        modulePaths = {},
    }
end

local function parse_test_case(line)
    local matches = vim.fn.matchlist(
                        line,
                        '\\v\\d+,(\\@AssumptionFailure: |\\@Ignore: )?(.*)(\\[\\d+\\])?\\((.*)\\)')
    if #matches == 0 then return nil end
    return {
        fq_class = matches[5],
        method = matches[3],
    }
end

local MessageId = {
    TestStart = '%TESTS',
    TestEnd = '%TESTE',
    TestFailed = '%FAILED',
    TestError = '%ERROR',
    TraceStart = '%TRACES',
    TraceEnd = '%TRACEE',
    IGNORE_TEST_PREFIX = '@Ignore: ',
    ASSUMPTION_FAILED_TEST_PREFIX = '@AssumptionFailure: ',
}

local function parse(buf, tests)
    local lines = vim.split(buf, '\n')
    local tracing = false
    local test = nil
    for _, line in ipairs(lines) do
        if vim.startswith(line, MessageId.TestStart) then
            test = parse_test_case(line)
            if test then
                test.traces = {}
                test.failed = false
            else
                print('Could not parse line: ', line)
            end
        elseif vim.startswith(line, MessageId.TestEnd) then
            table.insert(tests, test)
            test = nil
        elseif vim.startswith(line, MessageId.TestFailed) or
            vim.startswith(line, MessageId.TestError) then
            assert(
                test,
                'Encountered TestFailed/TestError, but no TestStart encounterd')
            test.failed = true
        elseif vim.startswith(line, MessageId.TraceStart) then
            tracing = true
        elseif vim.startswith(line, MessageId.TraceEnd) then
            tracing = false
        elseif tracing and test then
            table.insert(test.traces, line)
        end
    end
end

local function mk_buf_loop(sock, handle_buffer)
    local buffer = ''
    return function(err, chunk)
        assert(not err, err)
        if chunk then
            buffer = buffer .. chunk
        else
            sock:close()
            handle_buffer(buffer)
        end
    end
end

local function mk_test_results(bufnr)
    local tests = {}
    local handle_buffer = function(buf)
        parse(buf, tests)
    end
    return {
        show = function()
            local items = {}
            local repl = require('dap.repl')
            for _, test in ipairs(tests) do
                if test.failed then
                    repl.append('❌' .. test.method, '$')
                    for _, msg in ipairs(test.traces) do
                        local match = msg:match(
                                          string.format(
                                              'at %s.%s', test.fq_class,
                                              test.method) ..
                                              '%(([%a%p]*:%d+)%)')
                        if match then
                            local lnum = vim.split(match, ':')[2]
                            local trace = table.concat(test.traces, '\n')
                            if #trace > 140 then
                                trace = trace:sub(1, 140) .. '...'
                            end
                            table.insert(
                                items, {
                                    bufnr = bufnr,
                                    lnum = lnum,
                                    text = test.method .. ' ' .. trace,
                                })
                        end
                        repl.append(msg, '$')
                    end
                else
                    repl.append('✔️ ' .. test.method, '$')
                end
            end

            if #items > 0 then
                vim.fn.setqflist(
                    {}, 'r', {
                        title = 'jdtls-tests',
                        items = items,
                    })
                print(
                    'Tests finished. Results printed to dap-repl.',
                    'Errors added to quickfix list',
                    string.format('(❌%d / %d)', #items, #tests))
            else
                print(
                    'Tests finished. Results printed to dap-repl. All', #tests,
                    'succeeded')
            end
            return items
        end,
        mk_reader = function(sock)
            return vim.schedule_wrap(mk_buf_loop(sock, handle_buffer))
        end,
    }
end

local function run(testKind, config, buffer)
    local test_results
    local server = nil

    if testKind == TestKind.TestNG then
        dap.run(config)
        return
    end

    dap.run(
        config, {
            before = function(conf)
                server = uv.new_tcp()
                test_results = mk_test_results(buffer)
                server:bind('127.0.0.1', 0)
                server:listen(
                    128, function(err2)
                        assert(not err2, err2)
                        local sock = vim.loop.new_tcp()
                        server:accept(sock)
                        sock:read_start(test_results.mk_reader(sock))
                    end)
                conf.args = conf.args:gsub(
                                '-port ([0-9]+)',
                                '-port ' .. server:getsockname().port);
                return conf
            end,
            after = function()
                server:shutdown()
                server:close()
                Log.ins(test_results)
                local items = test_results.show()
                print('test results')
                Log.ins(items)
                ---maybe_repeat(lens, config, context, opts, items)
            end,
        })
end

local JUnit = class()

function JUnit:_init()
    self.client = Client
end

function JUnit.run(self, buffer, projectName, testKind, testLevel, testNames)
    return self.client.test.junit.arguments(
               projectName, testKind, testLevel, testNames):thenCall(
               function(launch_args)

            local config = get_run_args(testNames[1], launch_args, true)

            run(testKind, config, buffer)
        end)
end

return JUnit
