local border = {
    {'🭽', 'FloatBorder'},
    {'▔', 'FloatBorder'},
    {'🭾', 'FloatBorder'},
    {'▕', 'FloatBorder'},
    {'🭿', 'FloatBorder'},
    {'▁', 'FloatBorder'},
    {'🭼', 'FloatBorder'},
    {'▏', 'FloatBorder'},
}


CMD([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
CMD([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local on_attach = function()
    LSP.handlers['textDocument/hover'] =
      LSP.with(LSP.handlers.hover, {border = border})

    LSP.handlers['textDocument/signatureHelp'] =
      LSP.with(LSP.handlers.signature_help, {border = border})

    LSP.handlers['textDocument/publishDiagnostics'] =
      LSP.with(LSP.diagnostic.on_publish_diagnostics, {
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = true,
      })
end

return {on_attach = on_attach}
