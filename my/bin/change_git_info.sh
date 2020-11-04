#!/bin/bash

if [[ "$1" == "" ]]; then
	echo "change_git_info.sh target_email changed_name changed_email"
	exit 0
fi

target_email="$1"
changed_name="$2"
changed_email="$3"

git filter-branch --env-filter '
	an="$GIT_AUTHOR_NAME"
	am="$GIT_AUTHOR_EMAIL"
	cn="$GIT_COMMITTER_NAME"
	cm="$GIT_COMMITTER_EMAIL"
	if [ "$GIT_COMMITTER_EMAIL" = "'${target_email}'" ]; then
		cn="'${changed_name}'"
		cm="'${changed_email}'"
	fi
	if [ "$GIT_AUTHOR_EMAIL" = "'${target_email}'" ]; then
		an="'${changed_name}'"
		am="'${changed_email}'"
	fi
	export GIT_AUTHOR_NAME="$an"
	export GIT_AUTHOR_EMAIL="$am"
	export GIT_COMMITTER_NAME="$cn"
	export GIT_COMMITTER_EMAIL="$cm"
'
