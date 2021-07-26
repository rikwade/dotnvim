require("formatter").setup({
    logging = false,
    filetype = {
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0),
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
        lua = {
            function()
                return {
                    exe = "~/.cache/nvim/packer_hererocks/2.0.5/bin/lua-format",
                    args = {},
                    stdin = true
                }
            end
        },
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = {},
                    stdin = true,
                    cwd = vim.fn.expand("%:p:h")
                }
            end
        }
    }
})
