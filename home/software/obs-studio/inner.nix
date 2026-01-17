{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "obs-studio";
  };
in mkSoftware {

  programs.obs-studio = { enable = true; };
}
