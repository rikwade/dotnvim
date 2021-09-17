# dotnvim

Neovim configuration that uses `lua` as much as possible

| WARNING: I make continues changes to the config so create a fork first If you are using this |
| --- |

## Features

* Using packer instead of as package manager
* Tree Sitter syntax highlighting
* Pre-configured for various programming languages and documents
  * Java
  * Python
  * JavaScript
  * Typescript
  * HTML
  * CSS
  * JSON
  * Markdown
* Tabnine completion with coc.nvim (intelligent auto completion)

## Why lua not Vimscript?

* Read more about why [neovim chose lua](https://github.com/neovim/neovim/wiki/FAQ#why-embed-lua-instead-of-x)

## How to Install? (Ubuntu 20.04)

| WARNING: Guide is not be perfect so may run in to unexpected errors |
| --- |

* Update cache

```bash
sudo apt update
```

* Install following packages

```bash
sudo apt install git curl gcc python3-pip cmake
```

* Download and install latest version of `node` and `npm` from 
[node js download](https://nodejs.org/en/) (Make sure `node` and `npm` is
accessible from the command line)

* Install following languages packages

```bash
pip install --user neovim
```

* Download and install nerd font patched font from [nerdfonts.com](https://www.nerdfonts.com/font-downloads)
* Install Neovim (Please refer [Neovim installation guide](https://github.com/neovim/neovim/wiki/Installing-Neovim) for more information)
* Backup existing `nvim` configuration if you have one

```bash
mv ~/.config/nvim ~/.config/nvim-bak
```

* Clone my configuration

```bash
git clone --recurse-submodules -j8 https://github.com/s1n7ax/dotnvim.git ~/.config/nvim
```

* Run `nvim` and install plugins

```vim
:PackerInstall
:PackerCompile
:lua require"nvim.plugins.lspinstall".install_servers()
```

* Now, close and fire up `nvim` again.
