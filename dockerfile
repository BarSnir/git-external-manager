# Dockerfile
FROM alpine:latest

ARG GITHUB_TOKEN
ARG GITHUB_USER
ARG GITHUB_EMAIL
ARG GITHUB_REPO

ENV GITHUB_TOKEN=${GITHUB_TOKEN}
ENV GITHUB_USER=${GITHUB_USER}
ENV GITHUB_EMAIL=${GITHUB_EMAIL}
ENV GITHUB_REPO=${GITHUB_REPO}

RUN mkdir repo && cd repo
WORKDIR /repo

COPY . .
# Update package list and install bash, curl, and git
RUN apk update && \
    apk add --no-cache bash curl git

# Set the entrypoint to keep the container running
ENTRYPOINT ["tail", "-f", "/dev/null"]