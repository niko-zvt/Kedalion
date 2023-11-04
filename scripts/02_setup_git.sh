#! /bin/bash

# Create user

# Use:          sudo ./01_setup_git.sh <pat> <git_account> <git_repos>
# Example 1:    sudo ./01_setup_user.sh 123 user repo1 repo2 ...

ME=`basename "$0"`
PAT=$1
GIT_USER=$2
REPOS_COUNT=$#

# Print hello
echo "Script $ME started!"
echo "PAT: $PAT"
echo "USER: $GIT_USER"
echo "REPOS COUNT: $((REPOS_COUNT - 2))"

# Install git
apt install git -y

# Get repos
for((INDEX=1; INDEX <= $REPOS_COUNT; INDEX+=1));do
    if [ "$INDEX" -eq "1" ] || [ "$INDEX" -eq "2" ]
    then
        shift 1
    else
        echo "Repo $((INDEX - 2)): $1"
        # Clone repo
        git clone https://$PAT@github.com/$GIT_USER/$REPO.git
        shift 1
    fi
done
