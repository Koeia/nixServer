{ config, pkgs, ... }:

{

  home.username = "jctannu4";
  home.homeDirectory = "/home/jctannu4";
  home.stateVersion = "26.05";
  programs.git = {
    enable = true;
    settings = {
      credential.helper = "oauth";
      user = {
        name = "Koeia";
        email = "whereischason@protonmail.com";
      };
      init.defaultBranch = "server";
      core.editor = "vim";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/nixServer#nixServer";
    };
    initContent = ''
      		${pkgs.fastfetch}/bin/fastfetch
      		'';
    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "aussiegeek";
    };
  };

  home.packages = with pkgs; [
    git
    git-credential-manager
    git-credential-oauth
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];
}
