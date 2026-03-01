# AGENTS.md

This file provides guidance for agentic coding agents working in this Neovim configuration repository.

## Build/Lint/Test Commands

### Neovim Configuration
This is a Neovim configuration repository using Lua. There are no traditional build or test commands, but here are the relevant commands:

- **Update plugins**: `:Lazy sync` or `:Lazy update`
- **Update Treesitter parsers**: `:TSUpdate`
- **Check syntax**: `:syntax sync minlines=200` (adjust as needed)
- **Validate Lua**: Use `:lua vim.lsp.stop_client(vim.lsp.get_active_clients({bufnr = 0}))` to stop LSP, then check for Lua syntax errors

### LSP and Language Servers
- **Install LSP servers**: `:Mason` to open Mason and install/manage LSP servers
- **Check LSP status**: `:LspInfo`
- **Restart LSP**: `:LspRestart`

## Code Style Guidelines

### Lua Formatting
- **Indentation**: 4 spaces (no tabs)
- **Line length**: No hard limit, but aim for reasonable line lengths
- **Quotes**: Use single quotes for strings unless double quotes are required
- **Braces**: Opening braces on same line, closing braces on new line

### Naming Conventions
- **Files**: Use lowercase with underscores (e.g., `mstch/set.lua`)
- **Variables**: Use lowercase with underscores (e.g., `local lazypath`)
- **Functions**: Use lowercase with underscores (e.g., `function setup()`)
- **Constants**: Use UPPER_SNAKE_CASE (e.g., `local MAX_SIZE = 100`)

### Imports and Requires
- Use `require` for module imports
- Place requires at the top of files
- Group related requires together
- Example:
  ```lua
  local vim = vim
  local utils = require('utils')
  local config = require('config')
  ```

### Error Handling
- Use `pcall` for operations that might fail
- Provide meaningful error messages
- Example:
  ```lua
  local success, err = pcall(function()
      -- Operation that might fail
  end)
  if not success then
      vim.notify('Error: ' .. err, vim.log.levels.ERROR)
  end
  ```

### Comments
- Use `--` for single-line comments
- Use `--[[ ]]--` for multi-line comments
- Keep comments concise and relevant
- Avoid redundant comments

### Keybindings
- Use `<leader>` prefix for custom mappings
- Provide descriptive descriptions in the `desc` field
- Example:
  ```lua
  vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Find file (netrw)' })
  ```

### Plugin Configuration
- Use the lazy.nvim format for plugin configuration
- Return a table with plugin specifications
- Example:
  ```lua
  return {
      {
          'neovim/nvim-lspconfig',
          dependencies = { 'mason-org/mason.nvim' },
          config = function()
              -- Configuration code
          end
      }
  }
  ```

## Project Structure

```
/home/mstch/.dotfiles/.config/nvim/
├── init.lua                  # Main entry point
├── lua/
│   ├── config/
│   │   └── lazy.lua          # Lazy.nvim setup
│   ├── mstch/
│   │   ├── init.lua         # Main configuration
│   │   ├── set.lua          # Settings and options
│   │   └── remap.lua        # Key mappings
│   └── plugins/
│       ├── lsp.lua         # LSP configuration
│       ├── opencode.lua    # Opencode plugin
│       ├── snacks.lua      # Snacks plugin
│       ├── dap.lua         # Debugger configuration
│       ├── blink.lua       # Blink.cmp configuration
│       └── treesitter.lua  # Treesitter configuration
└── AGENTS.md                # This file
```

## Keybindings Reference

### General
- `<leader>pv`: Open netrw file explorer
- `<leader><space>x`: Source current file
- `<leader>x`: Source current line
- `<C-space>`: Auto-complete in insert mode

### Navigation
- `<leader>,`: Open picker
- `<leader>pf`: Find file
- `<C-p>`: Find file (git)
- `<leader>/`: Grep search
- `<leader>e`: File explorer
- `<leader>gg`: Open lazygit
- `<S-Tab>`: Buffer picker

### LSP
- `<leader>ss`: LSP symbols
- `<leader>sS`: LSP symbols (all)
- `<F2>`: Rename symbol
- `gra`: Code action
- `gd`: Goto definition
- `gD`: Goto declaration
- `gr`: Goto references
- `gI`: Goto implementation
- `<leader>th`: Toggle inlay hints

### Debugging
- `<F9>`: Toggle breakpoint
- `<F5>`: Continue
- `<S-F5>`: Restart
- `<F10>`: Step over
- `<F11>`: Step into
- `<S-F11>`: Step out

### Terminal
- `<leader>tt`: Toggle terminal

### Dashboard
- `<leader>w`: Welcome dashboard

## Development Workflow

1. **Install dependencies**: Ensure you have Neovim 0.9+ installed
2. **Clone repository**: Clone this config to `~/.config/nvim`
3. **Open Neovim**: Launch Neovim, lazy.nvim will auto-install plugins
4. **Install LSP servers**: Run `:Mason` and install required servers
5. **Configure**: Customize settings in `lua/mstch/set.lua`
6. **Extend**: Add new plugins in `lua/plugins/` directory

## Tips for Agents

1. **Always read existing code** before making changes
2. **Follow existing patterns** for consistency
3. **Use descriptive variable and function names**
4. **Add keybindings with descriptions**
5. **Test changes** before committing
6. **Update documentation** when adding new features
7. **Be mindful of performance** - avoid expensive operations in autocommands
8. **Use `:Lazy` to manage plugins**
9. **Leverage existing utilities** like Snacks for common operations
10. **Keep configurations modular** for easier maintenance

## Common Patterns

### Autocommands
```lua
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function()
        -- Setup for Python files
    end
})
```

### Conditional Configuration
```lua
if vim.fn.has('nvim-0.9') == 1 then
    -- Use Neovim 0.9+ features
end
```

### Plugin Options
```lua
{
    'plugin/name',
    opts = {
        option1 = true,
        option2 = false
    },
    config = function(_, opts)
        require('plugin').setup(opts)
    end
}
```

## Troubleshooting

- **Plugins not loading**: Run `:Lazy sync`
- **LSP not working**: Run `:LspInfo` and check for errors
- **Syntax highlighting issues**: Run `:TSUpdate`
- **Performance issues**: Check for expensive autocommands with `:autocmd`

## Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [Lua Guide](https://learnxinyminutes.com/docs/lua/)
