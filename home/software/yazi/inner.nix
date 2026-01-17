{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "yazi";
  };
in mkSoftware {

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
