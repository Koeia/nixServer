{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./services.nix
    ./hardware-configuration.nix
    ./lsps.nix
    ./devtools.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixServer";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  time.timeZone = "America/New_York";

  users.users.jctannu4 = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git-credential-manager
    libsecret
    gnome-keyring
    proton-vpn-cli
    package-version-server
    git
    vim
    wget
    curl
    udiskie
    usbutils
    yazi
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";

}
