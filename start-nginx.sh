#!/usr/bin/env sh
export EXISTING_VARS=$(printenv | awk -F= '{print $1}' | sed 's/^/\$/g' | paste -sd,);
for file in $JSFOLDER;
do
  if [ ! -f $file.tmp ]
  then
    cp $file $file.tmp
  fi
  cat $file.tmp | envsubst $EXISTING_VARS | tee $file
done
nginx -g 'daemon off;'
