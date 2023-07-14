-- Breadcrumbs using navic
local navic = require('nvim-navic')

require('lualine').setup {
    options = {
        theme = 'auto',
        icons_enabled = true,
        section_separators = {left = '', right = ''},
        component_separators = {left = '|', right = '|'}
    },

    sections = {
        lualine_x = {
            {'encoding'}, {
                'fileformat',
                icons_enabled = true,
                symbols = {unix = 'LF', dos = 'CRLF', mac = 'CR'}
            }, {'filetype'}
        }
    }

    -- winbar = {
    --     lualine_c = {
    --         {
    --             function() return navic.get_location() end,
    --             cond = function() return navic.is_available() end,
    --             draw_empty = true,
    --         },
    --     }
    -- }
}

