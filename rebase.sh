#!/bin/bash
#Git rebase post script
#If commits have been manually changed git will change the commit vars round but this is impractical for rebasing
#So this will retag all commits with their original values
git filter-branch -f --env-filter '
if [ "$GIT_COMMITTER_DATE" != "$GIT_AUTHOR_DATE" ];
then
	GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME";
	GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL";
	GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE";
fi
' -- --all
