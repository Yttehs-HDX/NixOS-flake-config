{ lib, ... }:

let
  inherit (lib) mkOption types;
in {
  options.style.font = mkOption {
    type = types.str;
    default = "DejaVu Sans";
    description = "Primary UI font family.";
  };
}
