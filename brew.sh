#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install wget
brew install htop
brew install telnet
brew install vim
brew install grep
brew install openssh
# brew install gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
# brew install exiv2
brew install git
brew install git-lfs
brew install p7zip
brew install pigz
brew install pv
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install zopfli
brew install lz4

brew install go
brew install gh
brew install tfenv
brew install jq
brew install pwgen
brew install mas # command line interface for the Mac App store
brew install ipcalc
brew install lastpass-cli
brew install goreleaser

brew install --cask iterm2
brew install --cask slack
brew install --cask docker
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask google-cloud-sdk
brew install --cask adoptopenjdk
brew install --cask tunnelblick
brew install --cask spotify
brew install --cask firefox

brew install kubectl helm kubectx kube-ps1
brew link --overwrite kubernetes-cli
brew install kustomize
brew install istioctl

# Remove outdated versions from the cellar.
brew cleanup

sudo mkdir -p /usr/local/gnubin
sudo chown -R ${USER}: /usr/local/gnubin
chmod 775 /usr/local/gnubin
# setup symlinks to gnu equivalents of utils to be included in PATH
for gnuutil in /usr/local/opt/*/libexec/gnubin/*; do
    ln -s $gnuutil /usr/local/gnubin/
done

# install Lastpass app from App Store
mas lucky "Lastpass Password Manager"
