#! /bin/bash

studentid=$1

# scp -i /github/home/.ssh/fetch_dc_rsa ${studentid}@sshgate.u-aizu.ac.jp:/usr/local/texlive/texmf-local/tex/aizu/U-AizuGT.cls .
echo "get /usr/local/texlive/texmf-local/tex/aizu/U-AizuGT.cls" | sftp -i ~/.ssh/fetch_dc_rsa -oStrictHostKeyChecking=no ${studentid}@sshgate.u-aizu.ac.jp 
