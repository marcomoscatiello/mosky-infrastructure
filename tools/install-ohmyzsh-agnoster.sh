#!/bin/bash

#echo "Oh-My-Zsh + Agnoster theme :"
#echo "1: Install"
#echo "2: Uninstall"
#echo "3: Abort"
#read -p "Select option [1 | 2 | 3 ] " CONT
#if [ "$CONT" = "1" ] ; then

#elif [ "$CONT = "2" ] ; then

#else "Operation Aborted. " ;
#fi

echo "This script will install oh-my-zsh + agnoster for git and iterm2"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  echo "installing oh-my-zsh.." ;
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ;

  if [ ! -e "$HOME/Library/Fonts/Meslo LG M Regular for Powerline.ttf" ] ; then
    printf "Powerline font not installed. "
    echo "installing powerline fonts for agnoster theme.."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/powerline/fonts/master/install.sh)"

  else echo "Powerline fonts already installed."
  fi  

  echo "modifying the theme to agnoster.."
  sed -i -e 's/robbyrussell/agnoster/g' ~/.zshrc ; 
  echo "modifying the agnoster configuration in this path.."
  echo $HOME/.oh-my-zsh/themes/agnoster.zsh-theme 
  sed -i -e "s/$CURRENT_FG \'%~\'/$CURRENT_FG \'%2~\'/g" $HOME/.oh-my-zsh/themes/agnoster.zsh-theme ; 
  echo "Last step: open iTerm2 Preferences -> Profiles -> Default -> Text -> Font -> Meslo LG M Regular for Powerline" ;
  echo "Last last step: open iTerms2 Preferences -> Profiles -> Colors -> Color Preset -> Solarized Dark" ;

else
  echo "installation aborted.";
fi
