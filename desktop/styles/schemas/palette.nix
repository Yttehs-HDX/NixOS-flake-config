{ lib, ... }:

let
  inherit (lib) mkOption types;
in {
  options.style.palette = mkOption {
    type = types.attrsOf types.str;
    default = {};
    description = "Resolved theme palette values (derived from style.theme).";
  };
}
