{ lib, profile, name, inner }:

let
  desktop = profile.desktop or { };
  aux = desktop.aux or { };
  item = aux.${name} or { };
  enabled = (desktop.enable or false) && (item.enable or false);
in { imports = lib.optionals enabled [ inner ]; }
