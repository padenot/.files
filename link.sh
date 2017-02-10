#/bin/sh

for i in $(ls -A -I link.sh -I .git)
do
  ln -f -s $(pwd)/$i ~/$i
done

git submodule init
git submodule update
ln -s `pwd`/paul.zsh-theme oh-my-zsh/themes/paul.zsh-theme
