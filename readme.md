## install
Docker compose build
Docker compose up -d

## Config:
git config --global user.email "<github_email>"
git config --global user.name "<github_user_name>" 
git remote set-url origin https://<github_token>@github.com/<github_user_name>/<github_repo_name>.git

## Usages:
docker compose exec -it alpine_container bash
Just use the Git CLI.