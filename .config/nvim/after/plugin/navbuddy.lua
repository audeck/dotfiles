-- Used exclusively for code navigation. For more functionality, see the
-- readme: https://github.com/SmiteshP/nvim-navbuddy#readme
local actions = require('nvim-navbuddy.actions')
local icons = require('audeck.icons').kind

require('nvim-navbuddy').setup({
    use_default_mappings = false,

    mappings = {
        ['k'] = actions.next_sibling(),
        ['i'] = actions.previous_sibling(),

        ['j'] = actions.parent(),
        ['l'] = actions.children(),

        ['<enter>'] = actions.select(),
        ['<esc>'] = actions.close()
    },

    lsp = {auto_attach = true},
    node_markers = {enabled = false},

    icons = {
        Array = icons.Array .. " ",
        Boolean = icons.Boolean .. " ",
        Class = icons.Class .. " ",
        Color = icons.Color .. " ",
        Constant = icons.Constant .. " ",
        Constructor = icons.Constructor .. " ",
        Enum = icons.Enum .. " ",
        EnumMember = icons.EnumMember .. " ",
        Event = icons.Event .. " ",
        Field = icons.Field .. " ",
        File = icons.File .. " ",
        Folder = icons.Folder .. " ",
        Function = icons.Function .. " ",
        Interface = icons.Interface .. " ",
        Key = icons.Key .. " ",
        Keyword = icons.Keyword .. " ",
        Method = icons.Method .. " ",
        Module = icons.Module .. " ",
        Namespace = icons.Namespace .. " ",
        Null = icons.Null .. " ",
        Number = icons.Number .. " ",
        Object = icons.Object .. " ",
        Operator = icons.Operator .. " ",
        Package = icons.Package .. " ",
        Property = icons.Property .. " ",
        Reference = icons.Reference .. " ",
        Snippet = icons.Snippet .. " ",
        String = icons.String .. " ",
        Struct = icons.Struct .. " ",
        Text = icons.Text .. " ",
        TypeParameter = icons.TypeParameter .. " ",
        Unit = icons.Unit .. " ",
        Value = icons.Value .. " ",
        Variable = icons.Variable .. " "
    }

})

-- Key binding
vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>')
require('which-key').register({['<leader>'] = {n = {'Open Navbuddy'}}})

