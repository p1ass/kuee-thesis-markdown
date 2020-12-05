#! /bin/bash

studentid=$1

scp -i ~/.ssh/fetch_dc_rsa ${studentid}@sshgate.u-aizu.ac.jp:/usr/local/texlive/texmf-local/tex/aizu/U-AizuGT.cls .
