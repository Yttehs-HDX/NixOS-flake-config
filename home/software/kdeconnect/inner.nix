{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "kdeconnect";
  };
in mkSoftware {

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
