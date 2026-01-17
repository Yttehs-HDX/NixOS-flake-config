{ config, lib, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config;
    name = "neovim";
  };
in mkHomeAux {

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
