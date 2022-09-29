FROM archlinux:latest


#--------------------------------------------------------------------#
#-                 installing packman dependencies                  -#
#--------------------------------------------------------------------#
RUN pacman -Syu --noconfirm
RUN pacman -S --needed --noconfirm \
    git \
    fd \
    wget \
    xclip \
    ripgrep \
    base-devel \
    unzip \
    cmake \
    jdk-openjdk \
    python-pip \
    npm \
    yarn \
    rust \
    zsh


RUN yarn global add prettier
RUN pip install --upgrade autopep8
RUN cargo install stylua
RUN cargo install taplo-cli


#--------------------------------------------------------------------#
#-                          env variables                           -#
#--------------------------------------------------------------------#
ENV SHELL="/bin/bash"
ENV PATH="~/.local/bin:${PATH}"
ENV PATH="~/.cargo/bin:${PATH}"
ENV PATH="~/.yarn/bin:${PATH}"


#--------------------------------------------------------------------#
#-                       setting up dotfiles                        -#
#--------------------------------------------------------------------#
WORKDIR /root
RUN git init .
RUN git remote add -f origin https://github.com/s1n7ax/dothome-new.git
RUN git switch main


#--------------------------------------------------------------------#
#-                       installing oh my zsh                       -#
#--------------------------------------------------------------------#
RUN CHSH=yes;RUNZSH=no;KEEP_ZSHRC=yes; sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



#--------------------------------------------------------------------#
#-                        installing neovim                         -#
#--------------------------------------------------------------------#
WORKDIR /
RUN git clone https://github.com/neovim/neovim.git
WORKDIR /neovim
RUN make CMAKE_BUILD_TYPE=Release
RUN make install
RUN ln -s /usr/local/bin/nvim /usr/sbin/nvim
RUN rm -rf /neovim


#--------------------------------------------------------------------#
#-                      setting neovim config                       -#
#--------------------------------------------------------------------#
RUN git clone --recurse-submodules -j8 https://github.com/s1n7ax/dotnvim.git ~/.config/nvim

WORKDIR /
RUN mkdir -p ~/.local/share/nvim/lsp_server_additions/jdtls
RUN git clone https://github.com/microsoft/java-debug.git
RUN git clone https://github.com/microsoft/vscode-java-test.git

WORKDIR /java-debug
RUN chmod u+x mvnw
RUN ./mvnw clean install -Dmaven.artifact.threads=10
RUN cp \
    com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar \
    ~/.local/share/nvim/lsp_server_additions/jdtls

WORKDIR /vscode-java-test
RUN yarn
RUN yarn build-plugin
RUN cp server/*.jar ~/.local/share/nvim/lsp_server_additions/jdtls

# Issue: when max_jobs is set the instance will not exist so following will
# remove the setting if exists and run PackerSync
# https://github.com/wbthomason/packer.nvim/issues/751
RUN sed -i "s/max_jobs *= *[0-9]\+,*//" ~/.config/nvim/lua/nvim/plugins/packer/install.lua


#--------------------------------------------------------------------#
#-                    installing neovim plugins                     -#
#--------------------------------------------------------------------#
RUN nvim \
    --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'silent PackerSync'

RUN nvim \
    --headless \
    -c 'set cmdheight=50' \
    -c 'silent TSInstallSync all' \
    -c 'sleep 20' \
    -c 'qall'

WORKDIR /root
