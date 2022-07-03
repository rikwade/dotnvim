FROM custom_arch

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
    rustup
    
RUN rustup install nightly
RUN rustup default nightly

RUN yarn global add prettier
RUN pip install --upgrade autopep8
RUN cargo install stylua
RUN cargo install taplo-cli

ENV SHELL="/bin/bash"
ENV PATH="~/.local/bin:${PATH}"
ENV PATH="~/.cargo/bin:${PATH}"
ENV PATH="~/.yarn/bin:${PATH}"

RUN git clone https://github.com/neovim/neovim.git

WORKDIR /neovim
RUN make CMAKE_BUILD_TYPE=Release
RUN make install
RUN ln -s /usr/local/bin/nvim /usr/sbin/nvim

RUN git clone --recurse-submodules -j8 https://github.com/s1n7ax/dotnvim.git ~/.config/nvim
RUN mkdir -p ~/.local/share/nvim/lsp_server_additions/jdtls

WORKDIR /
RUN git clone https://github.com/microsoft/java-debug.git
RUN git clone https://github.com/microsoft/vscode-java-test.git

WORKDIR /java-debug
RUN chmod u+x mvnw
RUN ./mvnw clean install
RUN cp \
    com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar \
    ~/.local/share/nvim/lsp_server_additions/jdtls

WORKDIR /vscode-java-test
RUN yarn
RUN yarn build-plugin
RUN cp server/*.jar ~/.local/share/nvim/lsp_server_additions/jdtls

WORKDIR /root
