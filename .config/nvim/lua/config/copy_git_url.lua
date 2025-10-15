local M = {}

function M.get_git_url()
    -- Get the current file path and line number
    local file_path = vim.fn.expand('%:p')
    local line_number = vim.fn.line('.')

    -- Get the git remote URL
    local handle = io.popen("git config --get remote.origin.url")
    local git_url = handle:read("*a")
    handle:close()
    git_url = git_url:gsub("\n", "")

    -- Check if the URL is an SSH URL and convert it to HTTPS if necessary
    if git_url:match("^git@") then
        git_url = git_url:gsub(":", "/")
        git_url = "https://" .. git_url:gsub("^git@", "")
    end

    -- Remove .git suffix if present
    git_url = git_url:gsub("%.git$", "")

    -- Get the repository root to create a relative path
    handle = io.popen("git rev-parse --show-toplevel")
    local repo_root = handle:read("*a")
    handle:close()
    repo_root = repo_root:gsub("\n", "")

    -- Create the relative file path from the repository root
    local relative_file_path = file_path:sub(#repo_root + 2)

    -- Get the current commit hash
    handle = io.popen("git rev-parse HEAD")
    local commit_hash = handle:read("*a")
    handle:close()
    commit_hash = commit_hash:gsub("\n", "")

    -- Ask the user if they want to use the commit hash or the main branch
    local branch_or_commit = vim.fn.input("Use commit hash? (y/n): ")

    local ref
    if branch_or_commit == "y" or branch_or_commit == "Y" then
        ref = commit_hash
    else
        ref = "main"
    end

    -- Construct the final URL
    local final_url = git_url .. "/blob/" .. ref .. "/" .. relative_file_path .. "#L" .. line_number

    -- Copy the URL to the clipboard
    vim.fn.setreg('+', final_url)
    print("Copied URL to clipboard: " .. final_url)
end

-- Create a command to call the function
vim.api.nvim_create_user_command('CopyGitUrl', M.get_git_url, {})

return M

