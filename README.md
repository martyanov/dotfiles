# dotfiles

My configuration files

## Install Emacs on OS X
```
brew install emacs --with-gnutls --with-cocoa --with-ctags
ln -sfv /usr/local/opt/emacs/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.emacs.plist
brew linkapps
```
