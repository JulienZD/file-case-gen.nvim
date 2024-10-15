
<h1 align="center">file-case-gen.nvim</h1>

### Features

- Insert a cased version of the current filename at the cursor

### Why?

- I miss this feature from Jetbrains IDEs, which autosuggest the name of the first thing you export from a file based on the file name
  - My Lua / Neovim skills aren't good enough to replicate this, so for now it's just a tiny utility to generate and insert it at the cursor 

### Installation

#### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "JulienZD/file-case-gen.nvim",
  keys = {
    -- stylua: ignore
    -- Other options are 'pascal' and 'snake'
    { '<C-]>', mode = 'i', function() require('file-case-gen').insert_file_name_as 'camel' end, },
  },
}
```
