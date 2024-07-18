# Development Environment Setup

This repository is primarily used to track my current configuration. Proceed at your own risk if you choose to use any of it.

## Tmux Configuration

### Relevant Files

- `.config/tmux/tmux.conf`

This file contains the configuration for tmux, including custom key bindings, status bar settings, and plugin management.

## Neovim Configuration

### Requirements

- True Color Terminal
- Neovim
- Nerd Font
- Ripgrep

### Relevant Files

- `.config/nvim/init.vim`

This directory contains the main configuration file for Neovim, including settings for plugins, key mappings, UI customizations, and more.


### Dad-bod

Ways to add databases to DB_UI:

- **Global Configuration:** Add databases globally in the Dad-bod file. There is a comment in the file indicating where to place the code to add databases if you want to add them globally.
- **.env File:** Declare databases in a `.env` file in your project if you use `dotenv.vim` plugin. DB_UI looks for `DB_UI_` prefixed variables. The syntax is `DB_UI_{name}={url}`. For example:
  ```plaintext
  DB_UI_DEV=postgresql://user:password@localhost:5432/dev_db
  DB_UI_PRODUCTION=postgresql://user:password@localhost:5432/prod_db
- **DB_UI Command:** You can use DB_UI command to add the database.

## WezTerm Configuration

### Relevant Files

- `.config/wezterm/wezterm.lua`

This file contains the configuration for WezTerm, including colorscheme settings, font configurations, and window settings.

## Command Line Tools

- `fzf`: A command-line fuzzy finder.
- `lazygit`: A simple terminal UI for git commands.
- `lazydocker`: A simple terminal UI for docker commands.


