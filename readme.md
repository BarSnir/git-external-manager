## Prerequisites:
Create ```.env``` file from .env.example template

## Install
```Docker compose build```

## Run:
```Docker compose up -d```

## Config:
1.```git config --global user.email "<github_email>"```
2.```git config --global user.name "<github_user_name>"```
3.```git remote set-url origin https://<github_token>@github.com/<github_user_name>/<github_repo_name>.git```

## Usages:
```./script.sh```
```docker compose exec -it alpine_container bash```
And just use the Git CLI.

## Hint
You might use sudo chmod ... on script.sh