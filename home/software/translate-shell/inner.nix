{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "translate-shell";
  };
in mkSoftware {

  programs.translate-shell.enable = true;
}
