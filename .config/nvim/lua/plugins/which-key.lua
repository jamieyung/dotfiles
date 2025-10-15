return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
  },
  keys = {
    -- debug
    { "<leader>d", group = "debug" },
    { "<leader>dC", "<Cmd>lua require'dap'.run_to_cursor()<CR>", desc = "Run to cursor" },
    { "<leader>dU", "<Cmd>lua require'dapui'.toggle()<CR>", desc = "Toggle UI" },
    { "<leader>db", "<Cmd>lua require'dap'.step_back()<CR>", desc = "Step back" },
    { "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>", desc = "Continue" },
    { "<leader>dd", "<Cmd>lua require'dap'.disconnect()<CR>", desc = "Disconnect" },
    { "<leader>df", "<Cmd>lua require'dapui'.float_element(nil, { width = 200, enter = true })<CR>", desc = "Open floating window" },
    { "<leader>di", "<Cmd>lua require'dap'.step_into()<CR>", desc = "Step into" },
    { "<leader>dl", "<Cmd>lua require'dapui'.float_element('scopes', { width = 200, enter = true })<CR>", desc = "Open locals in floating window" },
    { "<leader>do", "<Cmd>lua require'dap'.step_over()<CR>", desc = "Step over" },
    { "<leader>dp", "<Cmd>lua require'dap'.pause()<CR>", desc = "Pause" },
    { "<leader>dq", "<Cmd>lua require'dap'.close()<CR>", desc = "Quit" },
    { "<leader>ds", group = "start" },
    { "<leader>dst", "<Cmd>lua require'dap-go'.debug_test()<CR>", desc = "debug test" },
    { "<leader>dt", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
    { "<leader>du", "<Cmd>lua require'dap'.step_out()<CR>", desc = "Step out" },
    { "<leader>dw", "<Cmd>lua require'dapui'.float_element('watches', { width = 200, enter = true })<CR>", desc = "Open watches in floating window" },

    -- fzf.vim
    { "<leader>b", ":Buffers<CR>", desc = "Show buffers" },
    { "<leader>f", ":Files<CR>", desc = "Search for file" },
    { "<leader>F", ":RGFindMatchingFiles<CR>", desc = "Find files containing current word" },
    { "<leader>a", ":RG<CR>", desc = "Ripgrep in files" },
    { "<leader>s", "yiw:RG <C-r>0<CR>", desc = "Ripgrep in files with current word" },
    { "<leader>S", "yiW:RG <C-r>0<CR>", desc = "Ripgrep in files with current Word" },
    { "<leader>n", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" },

    -- git-blame.nvim
    { "<leader>gb", ":GitBlameToggle<CR>", desc = "Git blame toggle" },

    -- NERDTree
    { "<leader>r", ":NERDTreeFind<CR>", desc = "Show current file in NERDTree" },

    -- nvim-maximize-window-toggle
    { "<leader>m", ":ToggleOnly<CR>", desc = "Toggle maximise pane" },

    -- faster write / quit
    { "<leader>w", ":w<CR>", desc = "Save file" },
    { "<leader>z", ":wqa<CR>", desc = "Save and quit" },

    -- misc
    { "<leader>p", ":pu<CR>", desc = "Paste on newline" },
    { "<leader><CR>", ":nohlsearch<CR>", desc = "Clear highlighting" },
    { "<leader>x", ":call CloseBuffer()<CR>", desc = "Close buffer" },
  },
}
