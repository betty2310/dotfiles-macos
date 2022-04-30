#!/bin/sh

cp -a ~/.config/fish/ ~/ghq/github.com/betty2310/dotifles-macos/config/
cp -a ~/.config/nvim/ ~/ghq/github.com/betty2310/dotifles-macos/config/
cp ~/.config/starship.toml ~/ghq/github.com/betty2310/dotifles-macos/config/

rm -rf ~/ghq/github.com/betty2310/dotifles-macos/bin
mkdir ~/ghq/github.com/betty2310/dotifles-macos/bin
cp -a ~/.bin/ ~/ghq/github.com/betty2310/dotifles-macos/bin

timestamp() {
	date +"%d-%m-%Y at %T"
}
cd ~/ghq/github.com/betty2310/dotifles-macos/
git add .
git commit -m "⭐ feat(*): automatic update: $(timestamp)"
