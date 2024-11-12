# Dockerfile
FROM alpine:latest

RUN mkdir repo && cd repo
WORKDIR /repo

COPY . .

# Update package list and install bash, curl, and git
RUN apk update && \
    apk add --no-cache  zsh bash curl git nano

# Install Oh My Zsh (non-interactive mode)
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Set up plugins directory for Oh My Zsh
RUN mkdir -p ~/.oh-my-zsh/custom/plugins

# Install zsh-autosuggestions plugin
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting plugin
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Enable plugins in the .zshrc file
RUN sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Set zsh as the default shell
SHELL ["/bin/zsh", "-c"]

# Optional: Source .zshrc to apply configurations if you want changes applied on build
RUN echo "source ~/.zshrc" >> ~/.zshrc


ARG GITHUB_EMAIL
ARG GITHUB_USER
ARG GITHUB_REPO
ARG GITHUB_TOKEN


RUN git config --global user.email ${GITHUB_EMAIL} && \
git config --global user.name ${GITHUB_USER}

RUN git remote set-url origin "https://$GITHUB_TOKEN@github.com/$GITHUB_USER/$GITHUB_REPO.git"

SHELL ["/bin/zsh", "-c"]

# Set the entrypoint to keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]