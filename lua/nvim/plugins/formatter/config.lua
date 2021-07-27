local rockbin = require('packer.luarocks').get_bin_path()
local util = require('packer.util')
local luaformat = util.join_paths(rockbin, 'lua-format')

require("formatter").setup({
    logging = false,
    filetype = {
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", API.nvim_buf_get_name(0),
                        "--single-quote"
                    },
                    stdin = true
                }
            end
        },
        rust = {
            function()
                return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
            end
        },
        lua = {function()
            return {exe = luaformat, args = {}, stdin = true}
        end},
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = {},
                    stdin = true,
                    cwd = FN.expand("%:p:h")
                }
            end
        }
    }
})
