# Use Ubuntu LTS as neutral base
FROM ubuntu:24.04

# Install core system tools + shell environment
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    wget \
    sudo \
    zsh \
    fonts-powerline \
    software-properties-common \
    libssl-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Create developer user with host-matching UID/GID
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME --shell /bin/zsh

# Configure persistent shell history
RUN mkdir -p /home/$USERNAME/.zsh_history_dir \
    && touch /home/$USERNAME/.zsh_history_dir/history \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.zsh_history_dir

# Install Oh My Zsh and Powerlevel10k
USER $USERNAME
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh \
    && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc \
    && echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc

# Set up generic development paths
ENV PATH="/home/$USERNAME/.local/bin:$PATH"
WORKDIR /workspace