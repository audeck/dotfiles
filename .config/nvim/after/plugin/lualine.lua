require('lualine').setup {
    options = {
        theme = 'auto',
        icons_enabled = false,
        section_separators = {left = '', right = ''},
        component_separators = {left = '|', right = '|'}
    },

    sections = {
        lualine_x = {
            {'encoding'},
            {'fileformat', symbols = {unix = 'LF', dos = 'CRLF', mac = 'CR'}},
            {'filetype'}
        }
    }
}

