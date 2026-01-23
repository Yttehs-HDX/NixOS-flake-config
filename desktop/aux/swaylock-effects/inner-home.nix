{ pkgs, ... }:

{
  imports = [ ./themes/default.nix ];

  home.packages = [ pkgs.swaylock-effects ];
}
