#!/bin/bash

pacman -Qe > all-installed.list
pacman -Slq > official-repo.list
# Filter official packages
awk 'NR==FNR {repo[$1]; next} $1 in repo' official-repo.list all-installed.list > packages-official.list

# Filter unofficial packages
awk 'NR==FNR {repo[$1]; next} !($1 in repo)' official-repo.list all-installed.list > packages-unofficial.list


rm all-installed.list official-repo.list

echo "Official packages saved in packages-official.list"
echo "Unofficial packages saved in packages-unofficial.list"
