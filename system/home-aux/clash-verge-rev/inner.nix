{ config, lib, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config;
    name = "clash-verge-rev";
  };
in mkHomeAux {

  programs.clash-verge = {
    enable = true;
    tunMode = true;
    serviceMode = true;
    autoStart = true;
  };
}
