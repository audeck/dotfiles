local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')
local Rule = require('nvim-autopairs.rule')

npairs.setup({check_ts = true})

-- https://github.com/windwp/nvim-autopairs/wiki/Rules-API
-- npairs.add_rules({  -- autotag seems impossible to do
--     Rule('<', '>')
--         :with_pair(cond.not_inside_quote())
--         :with_move(cond.after_text('>'))
-- })
--

