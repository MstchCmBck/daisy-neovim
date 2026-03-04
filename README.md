# Neovim Configuration

This is a personal Neovim configuration repository designed for efficient software development workflows.

This configuration should works on both Linux and Windows.

I use it to write some `java` and `go`.

## Features

- **Lazy.nvim plugin management** - Fast plugin loading with [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Mason** - Loading of binaries (LSP and DAP) using [Mason.nvim](https://github.com/williamboman/mason.nvim)
- **Snacks.Picker** - Fuzzy finder provided by [Snacks.nvim](https://github.com/mstch/snacks.nvim)
- **Debugging integration** - DAP (Debug Adapter Protocol) setup with [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- **Code completion** - Blink.cmp for intelligent code completion using [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- **Mini.nvim** - Collection of small plugins with quality-of-life improvements from [mini.nvim](https://github.com/echasnovski/mini.nvim)

## Installation

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone https://github.com/mstch/.dotfiles.git ~/.config/nvim
   ```

2. Launch Neovim to automatically install plugins:
   ```bash
   nvim
   ```

3. Install LSP servers using Mason:
   ```vim
   :Mason
   ```

## Keybindings

### General
- `<leader>pv` - Open netrw file explorer
- `<leader><space>x` - Source current file
- `<leader>x` - Source current line
- `<C-space>` - Trigger completion

### Navigation
- `<leader>,` - Open picker
- `<leader>pf` - Find files
- `<C-p>` - Git file search
- `<leader>/` - Grep search
- `<leader>e` - File explorer
- `<leader>gg` - Open lazygit

### LSP
- `<leader>ss` - Show symbols
- `<leader>sS` - Show all symbols
- `F2` - Rename symbol
- `gra` - Code actions
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gI` - Go to implementation

### Debugging
- `F9` - Toggle breakpoint
- `F5` - Continue
- `Shift+F5` - Restart
- `F10` - Step over
- `F11` - Step into
- `Shift+F11` - Step out
- `F4` - Exit

## Customization

Edit the configuration files in `lua/mstch/` to customize your setup:
- `set.lua` - Neovim options and settings
- `remap.lua` - Key mappings and shortcuts

I try to write configuration and remap specific to a plugin inside the configuration of the plugin.
The purpose of this is to centralize what is specific to a plugin for the day I want to remove it.

## Plugin Management

I currently use [lazy.nvim](https://lazy.folke.io/).

Use `:Lazy` to manage plugins.

Neovim 0.12 will introduce a built-in packager that might be interesting to use.

## Requirements

- Neovim 0.9 or later
- Git
- ripgrep
- tree-sitter-cli
- fd-find

