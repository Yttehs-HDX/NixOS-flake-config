{ config, lib, pkgs, ... }:

{
  users.users.shetty = {
    isNormalUser = true;
    description = "Shetty Yttehs";
    extraGroups = [ "wheel" "adbusers" ];
    shell = pkgs.zsh;
  };
}

