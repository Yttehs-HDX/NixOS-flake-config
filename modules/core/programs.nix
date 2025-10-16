{ config, lib, pkgs, ... }:

{
  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    clash-verge = {
      enable = true;
      autoStart = true;
    };
  };
}

