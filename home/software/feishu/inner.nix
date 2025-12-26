{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.feishu;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.feishu ];
}
