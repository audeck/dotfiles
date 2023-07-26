
-- WSL (WinTerminal) clipboard integration
if vim.fn.has("wsl") == 1 then
    if vim.fn.executable("win32yank.exe") == 0 then
        print("Didn't find win32yank.exe. Cross-OS clipboard disabled.")
    else
        vim.g.clipboard = {
            name = 'win32yank-wsl',
            copy = {
                ['+'] =  'win32yank.exe -i --crlf',
                ['*'] =  'win32yank.exe -i --crlf',
            },
            paste = {
                ['+'] = 'win32yank.exe -o --lf',
                ['*'] = 'win32yank.exe -o --lf',
            },
            cache_enabled = true,
        }
    end
end

