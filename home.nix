{ pkgs, ... }:

{
  home.stateVersion = "24.05"; # Use the version you are working with
  home.username = "headset"; 
  home.homeDirectory = "/home/headset";
  imports = [
    ./zsh.nix
  ];

  # Other configurations...
}

