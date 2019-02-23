#!/bin/bash

: ${GIT_MASTER:?require path to git repo to rebase against}
: ${GIT_BESPOKE:?require path to repo to update against latest master}
: ${GIT_OUT:?output folder with rebased $GIT_BESPOKE repo}

git_master_repo=$(cd "${GIT_MASTER}" && git remote get-url origin)
echo "$git_master_repo"
git_master_branch=$(cd "${GIT_MASTER}" && git branch | tail -n1 | awk '{print $1}')
echo "$git_master_branch"

git clone "${GIT_BESPOKE}" "${GIT_OUT}"

git config --global user.email drnicwilliams@gmail.com
git config --global user.name "Dr Nic Williams"

cd "${GIT_OUT}" || exit 1
git remote add rebase-master "$git_master_repo" --master "$git_master_branch"
git fetch rebase-master
git rebase rebase-master
