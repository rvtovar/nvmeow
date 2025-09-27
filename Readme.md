# 🐾 nvmeow

**nvmeow** is a custom, modular Neovim (nvim) configuration focused on a modern, productive, and visually appealing editing experience. It leverages [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management, and comes with a curated set of plugins, key mappings, LSP integration, and custom filetype and dashboard enhancements.

---

## ✨ Features

- ⚡ **Plugin Management with lazy.nvim:** Fast, lazy-loading Neovim plugin system for improved performance.
- 🌈 **Modern UI and Themes:** Includes [nightfox](https://github.com/EdenEast/nightfox.nvim), [gloombuddy](https://github.com/bkegley/gloombuddy), and [nord.nvim](https://github.com/shaunsingh/nord.nvim) colorschemes.
- 🛠️ **LSP, Autocompletion, and Formatting:** Out-of-the-box language server config, code formatting, and autocompletion for multiple languages.
- 🌳 **Treesitter Syntax Highlighting:** Enhanced syntax highlighting and code understanding for Python, SQL, C++, and more.
- 🔍 **Fuzzy Finder and File Browser:** [Telescope](https://github.com/nvim-telescope/telescope.nvim) and its extensions for fast file, project, and symbol navigation.
- 🏁 **Dashboard & Bufferline:** Custom dashboard, buffer/tabline integration, and window picking.
- 🖥️ **Integrated Terminal & DAP:** ToggleTerm and Debug Adapter Protocol plugins for in-editor terminal and debugging.
- 🎹 **Rich Keymaps and Which-Key:** Discoverable and organized key mappings.
- 🗂️ **Neo-tree File Explorer:** Aesthetic, high-functionality file browser with git integration.
- 🌐 **HTTP Client:** REST client directly from Neovim via `kulala.nvim`.

---

## 📁 Directory Structure

```
.
├── .gitignore
├── .stylua.toml
├── init.lua
├── lua/
│   ├── config/
│   ├── helpers/
│   └── plugins/
├── queries/
│   ├── markdown/
│   └── python/
```

- `init.lua`: 🏁 Main entry point, loads core config, mappings, and colorscheme.
- `lua/config/`: 🛠️ Modular configuration for plugins and Neovim options.
- `lua/helpers/`: 🧩 Optional Lua helpers/utilities.
- `lua/plugins/`: 🎉 Plugin specifications and setup logic.
- `queries/`: 🌳 Treesitter queries for custom filetypes.

---

## 🚀 Installation

1. **Clone this repo somewhere (e.g., `~/.config/nvim`):**
   ```sh
   git clone https://github.com/rvtovar/nvmeow.git ~/.config/nvim
   ```

2. **Open Neovim (>=0.11) and plugins will install automatically via `lazy.nvim`.**


---

## 🛣️ Usage

- 📋 **Clipboard integration:** Enabled by default (`vim.opt.clipboard = "unnamedplus"`).
- 🗃️ **Custom filetypes:** E.g., `.ixx` files are treated as C++.
- 🎨 **Themes:** Default is `duskfox` (from nightfox), change in `init.lua` via `vim.cmd "colorscheme ..."`
- 🏁 **Dashboard:** Custom header set via `vim.g.dashboard_header = "nvmeow_full"` (see `config/dashboard.lua`).

### ⌨️ Key Features

- `<leader>?` — Show buffer local keymaps (via which-key)
- `<leader>R` — Send HTTP requests (via kulala.nvim)
- Project and file navigation via Telescope and Neo-tree
- Debugging via nvim-dap

---

## 🧩 Plugins (highlights)

- **LSP & Completion:** `nvim-lspconfig`, `nvim-cmp`, `mason.nvim`, `conform.nvim`
- **UI:** `gloombuddy`, `nightfox.nvim`, `bufferline.nvim`, `lualine.nvim`, `noice.nvim`
- **Fuzzy Finder:** `telescope.nvim`, `telescope-project.nvim`, `telescope-file-browser.nvim`
- **File Explorer:** `neo-tree.nvim`
- **DAP:** `nvim-dap`, `nvim-dap-ui`
- **GitHub Copilot:** `github/copilot.vim`
- **Window Picker:** `nvim-window-picker`
- **REST client:** `kulala.nvim`
- **Treesitter:** `nvim-treesitter`

For a full list, see `lua/plugins/init.lua`.

---

## 🛠️ Customization

- **Add/Remove plugins:** Edit `lua/plugins/init.lua`.
- **Change keymaps/settings:** Edit files within `lua/config/` or `init.lua`.
- **Style:** Adjust or add to `.stylua.toml` for formatting preferences.

---

## 🤝 Contributing

Pull requests and issues are welcome!

---

## 📜 License

MIT (see `LICENSE` file)

---

_Made with ❤️ by [rvtovar](https://github.com/rvtovar)
_[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
