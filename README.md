# dotnvim

100% lua neovim configuration

## Why Lua not Vimscript?

* Read more about why [neovim chose lua](https://github.com/neovim/neovim/wiki/FAQ#why-embed-lua-instead-of-x)

| WARNING: I'm a Colemak-DH user. So lot of the keymaps are not sutable for
QWERTY |
| --- |

| WARNING: I make frequent changes to the config so create a fork first if you
are using this |
| --- |

https://user-images.githubusercontent.com/18459807/140087936-36783efc-bfd9-4456-9693-559c668a6523.mp4

## Features

* Lazy load all plugins (except `startup-time`)
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

## WIP

* Debug features

## How to Install? (Ubuntu 20.04)

* Download the install script for Ubuntu:

[https://raw.githubusercontent.com/s1n7ax/dotnvim/main/scripts/install.sh](https://raw.githubusercontent.com/s1n7ax/dotnvim/main/scripts/install.sh)

* Add execute permission

```bash
chmod a+x install.sh
```

* Run the script

```bash
./install.sh
```

* Open `nvim`
