{ lib, config, pkgs, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.wechat;
in
mkWhenEnabled cfg.enable {
  home.packages = [ pkgs.wechat ];
}
