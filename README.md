# Dotfiles

My dotfiles for my shell, code editor, and global git config.

- Shell: zsh
    - Starship: A cross-shell prompt. Used to display languages of a project, language versions, docker context, and working git branch
    - thefuck: Command correction for mistyped commands
    - fzf: Fuzzy finder for rapid file searching in the terminal
    - zsh-syntax-highlighting: Syntax highlighting before command execution to display whether the command is recognized in the current context
    - zsh-autosuggestions: Autosuggestions for commands with autocompletion based on command history
    - eza: Modern, flexible ls replacement written in Rust

- Text Editor: Neovim
    - Packer: Neovim plugin manager
    - Telescope: Neovim file fuzzy finder
    - Autopairs: Automatic pairing for (), [], and {}
    - Treesitter: Syntax highlighter
    - LSPConfig: Language Server Protocol (LSP) Manager
    - Mason: Easy install for LSPs, formatters, linters, and debuggers
    - Gitsigns: Inline git comparison for files
    - Vim-Fugitive: Git integration in Neovim
    - Lualine: Context Display
    - Nvim-Tree: File Tree Display
    - LuaSnip: Snippet Manager with common VSCode snippet integration
    - multipe-cursors.nvim: Multi-Cursor editing in Neovim

- Terminal Emulator: Wezterm
    - Default Shell: zsh
    - Default Terminal Multiplexer: tmux

- Global Package Manager: Homebrew

## Dependencies for this Repository Running Correctly

### Installed
- Neovim
- Wezterm
- Tmux
- Git
- Zsh
    - Starship
    - fzf
    - zsh-syntax-highlighting
    - zsh-autosuggestions
    - eza
    - rbenv

Command:
- Homebrew: `brew install nvim wezterm zsh-autosuggestions zsh-syntax-highlighting eza fzf starship rbenv`
- Packer (inside Neovim): `:PackerSync`
