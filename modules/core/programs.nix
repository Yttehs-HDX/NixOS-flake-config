{ config, lib, pkgs, ... }:

{
  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    nix-ld.enable = true;
    clash-verge = {
      enable = true;
      tunMode = true;
      serviceMode = true;
      autoStart = true;
    };
  };
}

