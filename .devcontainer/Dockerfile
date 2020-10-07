FROM elixir:1.10.3

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Install vim, git, process tools, lsb-release
    && apt-get install -y \
    vim \
    git \
    iproute2 \
    procps \
    lsb-release \
    zsh

RUN mix local.hex --force \
    && mix archive.install --force hex phx_new 1.5.1 \
    && apt-get update \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash \
    && apt-get install -y apt-utils \
    && apt-get install -y nodejs \
    && apt-get install -y build-essential \
    && apt-get install -y inotify-tools \
    && mix local.rebar --force

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
RUN chsh -s /usr/bin/zsh root

RUN mkdir ~/.ssh && ln -s /run/secrets/host_ssh_key ~/.ssh/id_rsa

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog