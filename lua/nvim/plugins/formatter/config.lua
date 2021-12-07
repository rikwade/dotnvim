local rockbin = R('packer.luarocks').get_bin_path()
local util = R('packer.util')
local file_util = R('nvim.utils.file')
local os_util = R('nvim.utils.os')
local list_util = R('nvim.utils.lua.list')
local v = vim
local fn = v.fn

local luaformat = util.join_paths(rockbin, 'lua-format')

local prettier_formatter = function(...)
    local additional_args = { ... }

    return function()
        local args = {
            '--stdin-filepath',
            API.nvim_buf_get_name(0),
            '--no-color',
            '--loglevel silent',
        }

        if additional_args then
            args = list_util.concat(args, additional_args)
        end

        local config_files = {
            'prettierrc',
            'prettierrc',
            'prettierrc.yml',
            'prettierrc.yaml',
            'prettierrc.json5',
            'prettierrc.js',
            'prettierrc.cjs',
            'prettier.config.js',
            'prettier.config.cjs',
            'prettierrc.toml',
            '.prettierrc',
            '.prettierrc',
            '.prettierrc.yml',
            '.prettierrc.yaml',
            '.prettierrc.json5',
            '.prettierrc.js',
            '.prettierrc.cjs',
            '.prettier.config.js',
            '.prettier.config.cjs',
            '.prettierrc.toml',
        }

        local cwd = FN.getcwd()

        -- check if a prettier config available in cwd
        local has_local_config = list_util.any(config_files, function(file)
            return FN.findfile(file, cwd, 1) ~= ''
        end)

        -- if not found then use the global prettier config
        if not has_local_config then
            local prettier_conf = nil

            os_util.run_on_os({
                linux = function()
                    local home = os.getenv('HOME')
                    prettier_conf = home .. '/.config/prettier/prettierrc.json'
                end,
                -- @TODO add pretteir conf for windows and mac
            })

            if file_util.exists(prettier_conf) then
                table.insert(args, '--config ' .. prettier_conf)
            end
        end

        return {
            exe = 'prettier',
            args = args,
            stdin = true,
        }
    end
end

R('formatter').setup({
    logging = false,
    filetype = {
        javascript = { prettier_formatter('--parser typescript') },
        typescript = { prettier_formatter('--parser typescript') },
        typescriptreact = { prettier_formatter('--parser typescript') },
        javascriptreact = { prettier_formatter('--parser typescript') },
        -- @TODO once the prettier-plugin-java is added all the formatters are
        -- slow
        -- Need to replace java formatter with something else
        java = { prettier_formatter('--parser java') },
        json = { prettier_formatter('--parser json') },
        rust = {
            function()
                return {
                    exe = 'rustfmt',
                    args = { '--emit=stdout' },
                    stdin = true,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = {},
                    stdin = false,
                }
            end,
        },
        cpp = {
            function()
                return {
                    exe = 'clang-format',
                    args = {},
                    stdin = true,
                    cwd = FN.expand('%:p:h'),
                }
            end,
        },
    },
})
