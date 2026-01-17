{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "git";
  };
in mkSoftware {

  programs.git = {
    enable = true;
    settings = { alias = { lazy = "!lazygit"; }; };
  };
}
