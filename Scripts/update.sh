#!/bin/sh

STD=$PWD

cd ~/nixos-dotfiles

if [ $(hostname) == "nixCall" ]; then
    git switch main
    sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixCall
elif [ $(hostname) == "nixDesk" ]; then
    git switch Desktop
    sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixDesk
elif [ $(hostname) == "nixServer" ]; then
    git switch Server
    sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixServer
fi
