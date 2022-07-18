local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

---@diagnostic disable-next-line: undefined-global
local v = vim
local env = v.env

local M = {}

local function setup_server_config(conf)
    env.WORKSPACE = env.HOME .. '/.cache/jdtls'

    conf
        :set_option('vmargs', {
            '-XX:+UseParallelGC',
            '-XX:GCTimeRatio=4',
            '-XX:AdaptiveSizePolicyWeight=90',
            '-Dsun.zip.disableMemoryMapping=true',
            '-Djava.import.generatesMetadataFilesAtProjectRoot=false',
            '-Xmx4G',
            '-Xms512m',
        })
        :set_option('use_lombok_agent', true)
end

local function setup_extended_capabilities(conf)
    local init_options = conf:get_option_or_default('init_options', {})

    init_options.extendedClientCapabilities = v.tbl_deep_extend(
        'force',
        init_options.extendedClientCapabilities or {},
        {
            classFileContentsSupport = true,
        }
    )

    conf:set_option('init_options', init_options)
end

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, conf)
        if ls == 'jdtls' then
            setup_server_config(conf)
            setup_extended_capabilities(conf)
        end
    end)
end

return M
