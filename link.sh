#/bin/sh

for i in $(ls -A -I link.sh -I .git)
do
  ln -f -s $(pwd)/$i ~/$i
done
