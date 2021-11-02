echo '------------------------- Install Basic Dependencies -------------------------'
sudo apt install -y git curl gcc python3-pip cmake ripgrep python-is-python3 unzip

echo
echo
echo
echo '------------------------- Install Neovim -------------------------'
if ! command -v nvim &> /dev/null
then
    sudo curl -o /usr/bin/nvim -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    sudo chmod a+x /usr/bin/nvim
fi

# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
echo
echo
echo
echo '------------------------- Install NodeJS-------------------------'
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

echo
echo
echo
echo '------------------------- Install Yarn --------------------------'
sudo npm install --global yarn

NVIM_HOME=~/.config/nvim

[ -d $NVIM_HOME ] && mv $NVIM_HOME ~/.config/nvim-bak

echo
echo
echo
echo '------------------------- Download s1n7ax neovim config --------------------------'
git clone --recurse-submodules -j8 https://github.com/s1n7ax/dotnvim.git ~/.config/nvim

echo
echo
echo
echo '------------------------- Install nerdfont --------------------------'
if [ ! -d "~/.fonts/CascadiaCode" ]; then
    TEMP_NAME=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
    TEMP_DIR="/tmp/$TEMP_NAME"
    mkdir $TEMP_DIR
    curl -o "$TEMP_DIR/CascadiaCode.zip" -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip
    unzip "$TEMP_DIR/CascadiaCode.zip" -d "$TEMP_DIR/CascadiaCode"
    mkdir -p ~/.fonts
    mv "$TEMP_DIR/CascadiaCode" ~/.fonts/
fi
