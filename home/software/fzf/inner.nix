{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "fzf";
  };
in mkSoftware {

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
