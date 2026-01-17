{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "btop";
  };
in {
  imports = [ ./themes/catppuccin.nix ];

  config = (mkSoftware { programs.btop = { enable = true; }; }).config;
}
