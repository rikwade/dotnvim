local lsp_util = R'nvim.utils.lsp.util'
local dap = R'dap'

dap.adapters.java = function(callback)
    print('starting the debugger')
    lsp_util.execute_command({command = 'vscode.java.startDebugSession'},
                             function(err, port)
        Log.ins(err)
        Log.ins(port)
        assert(not err, vim.inspect(err))
        callback({type = 'server', host = '127.0.0.1', port = port})
    end)

end

dap.configurations.java = {
    {
        name = 'Launch DemoApplication',
        javaExec = '/usr/bin/java',
        mainClass = 'com.example.demo.DemoApplication',
        request = 'launch',
        type = 'java',
        classPaths = {'/home/s1n7ax/Workspace/demo/build/classes/java/main/'},
        modulePaths = {},
    },
}
