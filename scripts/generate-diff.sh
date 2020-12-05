readonly filename=$1
docker run -it --rm -v "`pwd`":/workdir  plass/mdtopdf:include-fonts /bin/sh -c "./scripts/diff.sh ${filename}"
