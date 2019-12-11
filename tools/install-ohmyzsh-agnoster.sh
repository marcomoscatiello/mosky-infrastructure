#!/bin/bash

echo "This script will install oh-my-zsh + agnoster for git and iterm2"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  echo "installing oh-my-zsh.." ;
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ;
  
  echo "installing powerline fonts for agnoster theme.."
  mkdir -p temp-agnoster && cd "$_" ;
  git clone https://github.com/powerline/fonts.git --depth=1 temp-agnoster ; ./temp-agnoster/fonts/install.sh ;
  rm -rf temp-agnoster ;
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
