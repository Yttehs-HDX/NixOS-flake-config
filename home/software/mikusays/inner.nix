{ config, lib, nur, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "mikusays";
  };
in mkSoftware {

  home.packages = [ nur.zerozawa.mikusays ];
}
