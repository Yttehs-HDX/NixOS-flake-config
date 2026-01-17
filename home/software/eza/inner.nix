{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "eza";
  };
in mkSoftware {

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "always";
    git = true;
  };
}
