{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "vscode";
  };
in mkSoftware {

  programs.vscode.enable = true;
}
