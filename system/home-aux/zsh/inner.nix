{ config, lib, pkgs, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config;
    name = "zsh";
  };
in mkHomeAux {

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
