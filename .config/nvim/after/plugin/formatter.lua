require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = function() vim.lsp.buf.format() end, -- Requires lua_ls
        cs = require("formatter.filetypes.cs").dotnetformat,
        css = require("formatter.filetypes.css").stylefmt,
        html = require("formatter.filetypes.html").htmlbeautify,
        -- markdown = require("formatter.filetypes.markdown").prettier,
        rust = require("formatter.filetypes.rust").rustfmt,
        typescript = require("formatter.filetypes.typescript").eslint_d,
        typescriptreact = require("formatter.filetypes.typescriptreact").eslint_d,
    }
})

-- Format after after write
vim.api.nvim_exec([[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost * FormatWrite
    augroup END
]], false)
