# Dockerfile
FROM alpine:latest

RUN mkdir repo && cd repo
WORKDIR /repo

COPY . .

# Update package list and install bash, curl, and git
RUN apk update && \
    apk add --no-cache bash curl git

ARG GITHUB_EMAIL
ARG GITHUB_USER
ARG GITHUB_REPO
ARG GITHUB_TOKEN


RUN git config --global user.email ${GITHUB_EMAIL} && \
git config --global user.name ${GITHUB_USER}

RUN git remote set-url origin "https://$GITHUB_TOKEN@github.com/$GITHUB_USER/$GITHUB_REPO.git"


# Set the entrypoint to keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]