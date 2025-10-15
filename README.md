1. Copy over:
  - .gitalias
  - .gitconfig
  - .gitignore_global
  - .zshenv
  - .config

2. Install tmux plugin manager (tpm)
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

3. Install ghostty
```sh
brew install --cask ghostty
```

4. Configure ghostty
Press command-, to open the ghostty config. Paste:
```
macos-titlebar-style="hidden"
macos-option-as-alt=true
```

5. Install fzf
```sh
brew install fzf
```

6. Optional: remove un-necessary nvim config
- .config/nvim/after (filetype-specific config)
- .config/nvim/lua/plugins/lsp.lua (lsp config blocks)
