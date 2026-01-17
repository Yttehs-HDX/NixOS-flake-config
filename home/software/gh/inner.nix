{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "gh";
  };
in mkSoftware {

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    extensions = [ pkgs.gh-copilot ];
  };
}
