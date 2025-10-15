require('config.settings')
require('config.close_buf_keep_splits')
require('config.lazy') -- loads plugins from the plugins dir
require('config.misc')
require('config.copy_git_url')
require('config.rg')

vim.lsp.set_log_level("warn")
-- vim.lsp.set_log_level("debug") -- uncomment if need to debug something
