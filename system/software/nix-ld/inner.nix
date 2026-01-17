{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "nix-ld";
  };
in mkSystemSoftware {

  programs.nix-ld.enable = true;
}
