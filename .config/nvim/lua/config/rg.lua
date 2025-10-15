vim.cmd([[
let s:ignoredFiletypes = ['asset','meta','mat','prefab','unity','physicMaterial','inputactions','png','webp']

function! RipgrepFzf(query, fullscreen)
    let command_fmt = "rg --column --line-number --no-heading --color=always --smart-case -g '!deps/*'"
    for type in s:ignoredFiletypes
        let command_fmt .= " -g '!*." . type . "'"
    endfor
    let command_fmt .= ' %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
]])

function rg_find_matching_files()
    local current_word = vim.fn.expand('<cword>')
    local rg_cmd = string.format('rg --files-with-matches --no-heading --smart-case %s', vim.fn.shellescape(current_word))
    local output = vim.fn.systemlist(rg_cmd)
    if vim.v.shell_error ~= 0 then
        print('Error running Ripgrep')
        return
    end
    local quickfix_list = {}
    for _, file in ipairs(output) do
        table.insert(quickfix_list, { filename = file })
    end
    vim.fn.setqflist(quickfix_list, 'r')
    vim.cmd('copen')
end

vim.api.nvim_create_user_command('RGFindMatchingFiles', rg_find_matching_files, {})
