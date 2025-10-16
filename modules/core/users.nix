{ config, lib, pkgs, ... }:

{
  users.users.shetty = {
    isNormalUser = true;
    description = "Shetty Yttehs";
    extraGroups = [
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}

