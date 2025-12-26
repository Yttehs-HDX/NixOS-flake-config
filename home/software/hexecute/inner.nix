{ lib, config, pkgs, hexecute, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.hexecute;
in
mkWhenEnabled cfg.enable {
  home.packages = [ hexecute.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
