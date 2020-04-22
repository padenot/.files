#!/bin/bash -e

IFS=$'\n'
patch_count=0
DEST_REPO=$2
TMP_PATCH_DIR=`mktemp -d`

usage() {
  echo "usage()"
  echo "\t$0 revset cubeb_directory"
  exit 1
}

if [ $# -ne 2 ]
then
  usage $0
  exit 1
fi

if [ ! -d $2 ]
then
  usage $0
fi

# arbitrary file that we know is in cubeb
if [ ! -e "$2/cubeb.supp" ]
then
  usage $0
fi

for i in `hg log -r "$1 and file('media/libcubeb/**')" --template "{rev} {files}\n"`
do
  IFS=" "
  echo $i
  rev=$(echo "$i" | cut -d ' ' -f1)
  files=(`echo "$i" | cut -d ' ' -f2-`)
  file_count=${#files[@]}

  if [[ $file_count -ne 1 ]]
  then
    continue
  fi
  for path in $files
  do
    if [[ $path != *"media/libcubeb"* ]]
    then
      echo "error: $i contains code that is not cubeb code"
      exit 1
    fi
  done
  echo $rev " contains only cubeb changes, exporting..."
  hg export --git -r $rev | hg-patch-to-git-patch > $TMP_PATCH_DIR/"$patch_count"
  patch_count=$((patch_count + 1))
done

DOWNSTREAM=`pwd`
cd $DEST_REPO

if [[ -n `git diff` ]]
then
  echo "git repo dirty, exiting"
fi

for i in *_git
do
  git am -p3 $DOWNSTREAM/$i
done

cd -
rm -r $TMP_PATCH_DIR
