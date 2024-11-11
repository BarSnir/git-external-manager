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
ARG GITHUB_TOKEN
ARG GITHUB_REPO

# Set the entrypoint to keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]