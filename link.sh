#/bin/sh

for i in $(ls -A -I link.sh)
do
  ln -f -s $(pwd)/$i ~/$i
done
