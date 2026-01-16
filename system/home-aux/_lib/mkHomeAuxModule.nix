{ lib, profile, name, inner }:

let
  home = profile.home or { };
  sw = home.software or { };
  item = sw.${name} or { };
  enabled = item.enable or false;
in { imports = lib.optionals enabled [ inner ]; }
