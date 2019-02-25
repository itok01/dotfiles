#!/bin/sh

while true; do
  read -p 'Do you want to install zplug? [Y/n]' _AWNSER
  case $_AWNSER in
    [Yy] | [Yy][Ee][Ss] | '' )
      echo 'Installing...'
      curl -fsSL https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    break;;
    [Nn] | [Nn][Oo] | * )
    break;;
  esac
done
cp -rf ./.zshrc ~/.zshrc

while true; do
  read -p 'Do you want to install Dein.vim? [Y/n]' _AWNSER
  case $_AWNSER in
    [Yy] | [Yy][Ee][Ss] | '' )
      echo 'Installing...'
      curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh -s "$HOME/.cache/dein"
    break;;
    [Nn] | [Nn][Oo] | * )
    break;;
  esac
done
cp -rf ./.vimrc ~/.vimrc
cp -rf ./.config/nvim/init.vim ~/.config/nvim/init.vim
cp -rf ./.vim/dein.toml ~/.vim/dein.toml
