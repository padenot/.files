#/bin/sh

for i in `ls -A config`
do
  ln -f -s $(pwd)/config/$i ~/$i
done

git submodule init
git submodule update
ln -s `pwd`/paul.zsh-theme oh-my-zsh/themes/paul.zsh-theme
