#!/bin/bash

#Install git support large files
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
git lfs install

#Update crontab daily at 00:00
(crontab -l ; echo "$(echo '0 0 * * *'" cd $(pwd) && "'./backup.sh' ; crontab -l)") 2>&1 | sed "s/no crontab for $(whoami)//" | sort | uniq | crontab -
