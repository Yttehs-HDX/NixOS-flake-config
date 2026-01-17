{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "lazygit";
  };
in mkSoftware {

  programs.lazygit.enable = true;
}
