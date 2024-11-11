git config --global user.email ${GITHUB_EMAIL} && \
git config --global user.name ${GITHUB_USER} && \
git remote set-url origin https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git