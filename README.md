
<h1 align="center">file-case-gen.nvim</h1>

### Features

- Insert a cased version of the current filename at the cursor
- Specify overrides based on file patterns

### Why?

- I miss this feature from Jetbrains IDEs, which autosuggest the name of the first thing you export from a file based on the file name
  - My Lua / Neovim skills aren't good enough to replicate this, so for now it's just a tiny utility to generate and insert it at the cursor 

### Installation

#### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "JulienZD/file-case-gen.nvim",
  opts = {}, 
}
```

### Configuration

The following configuration options are available:

- `default_case`: The default case to use when no override is specified. Options are `'camelCase'`, `'PascalCase'`, and `'snake_case'`
- `file_overrides`: A table of overrides for specific files. The key is the filename, and the value is the case to use. Options are `'camelCase'`, `'PascalCase'`, and `'snake_case'`

#### Default configuration

```lua
{
  default_case = 'camelCase',
  file_overrides = {},
}
```

#### Example configuration

```lua
{
  "JulienZD/file-case-gen.nvim",
  opts = {
    default_case = 'camelCase',
    file_overrides = {
      ['%.controller%.ts$'] = 'PascalCase', -- Use PascalCase for TypeScript files ending with 'controller'
    },
  },
  keys = {
    { '<C-]>', mode = 'i', function() require('file-case-gen').insert_cased_file_name() end, },
  },
}
```

