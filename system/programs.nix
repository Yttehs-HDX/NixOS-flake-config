{ config, lib, pkgs, ... }:

{
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    clash-verge = {
      enable = true;
      tunMode = true;
      serviceMode = true;
      autoStart = true;
    };
    adb.enable = true;
  };
}
