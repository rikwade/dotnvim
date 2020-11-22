# dotnvim
Neovim configuration that uses `lua` as much as possible

## Why lua not vimscript?
* Read more about why [neovim chose lua](https://github.com/neovim/neovim/wiki/FAQ#why-embed-lua-instead-of-x)

## You should know this before using
* Things may not be perfect as they were
	* `neovim` built in `lsp` may not be the best at the moment compared to something like `coc-nvim`
	* `nvim-lspconfig` provide some `lsp` features but a lot of features are missing (you will have to configure them yourselves)
		* `coc-nvim` and `lsp-config` both use `jdtls` but for some reason features like "go to definition" work better on `coc-nvim`
	
* Not everything is in `lua`
	* Most of the plugins are still in `vimscript` so this is not 100% `lua` but I'm doing my best to find `lua` alternatives
	* `lua` integration is still in development so things might break

## How to use?
### On Linux
* Clone and install `neovim` nightly build
```
git clone https://github.com/neovim/neovim.git ~/neovim
cd ~/neovim
make
sudo make install
```
* Backup existing `nvim` configuration if you have one
```
mv ~/.config/nvim ~/.config/nvim-bak
```
* Clone my configuration
```
git clone --recurse-submodules -j8 https://github.com/s1n7ax/dotnvim.git ~/.config/nvim
```
* Run `nvim` and install plugins
```
cd ~/.config/nvim
nvim

// run following neovim command to install plugins
:luafile lua/plugins.lua
```
* Now, close and fire up `nvim` again. Everything should work now
