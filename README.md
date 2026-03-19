# Neovim Configuration

This is a personal Neovim configuration repository designed for efficient software development workflows.

This configuration should works on both Linux and Windows.

I use it to write some `java`, `python` and `go`.
Using it to take note might be a further 

## Features

- **Lazy.nvim plugin management** - Fast plugin loading with [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Mason** - Loading of binaries (LSP and DAP) using [Mason.nvim](https://github.com/williamboman/mason.nvim)
- **Snacks.Picker** - Fuzzy finder provided by [Snacks.nvim](https://github.com/mstch/snacks.nvim)
- **Debugging integration** - DAP (Debug Adapter Protocol) setup with [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- **Code completion** - Blink.cmp for intelligent code completion using [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- **Mini.nvim** - Collection of small plugins with quality-of-life improvements from [mini.nvim](https://github.com/echasnovski/mini.nvim)

There is other nice tools, but the prior one are the backbone of this config.

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

Then you have to installed the following packages:
- jdtls
- java-debug-adpater
- java-test
- gopls
- delve
- pyright
- lua_ls

## Plugin Management

I currently use [lazy.nvim](https://lazy.folke.io/).

Use `:Lazy` to manage plugins.

> [!NOTE]
> Neovim 0.12 will introduce a built-in packager that might be interesting to use.

## Requirements

- Neovim 0.11 or later
- Git
- ripgrep
- tree-sitter-cli
- fd-find

