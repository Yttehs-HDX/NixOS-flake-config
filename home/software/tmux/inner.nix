{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "tmux";
  };
in mkSoftware {

  programs.tmux.enable = true;
}
