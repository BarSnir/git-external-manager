## Prerequisites:
Create ```.env``` file from .env.example template

## Install
```Docker compose build```

## Run:
```Docker compose up -d```

## Config:
1. ``` 
    git config --global user.email ${GITHUB_EMAIL} && \
    git config --global user.name ${GITHUB_USER} && \
    git remote set-url origin https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git
    ```

## Usages:
```./script.sh```
```docker compose exec -it alpine_container bash```
And just use the Git CLI.

## Hint
You might use sudo chmod ... on script.sh