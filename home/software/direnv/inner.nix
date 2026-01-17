{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "direnv";
  };
in mkSoftware {

  programs.direnv = {
    enable = true;
    silent = true;

    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
