{ lib, ... }:

let
  inherit (lib) mkOption types;

in {
  options.style.theme = {
    name = mkOption {
      type = types.enum [ "catppuccin" ];
      default = "catppuccin";
      description = "Style theme name (Catppuccin-only contract).";
    };

    variant = mkOption {
      type = types.enum [ "latte" "frappe" "macchiato" "mocha" ];
      default = "mocha";
      description = "Catppuccin flavor to apply across themed modules.";
    };

    accent = mkOption {
      type = types.str;
      default = "lavender";
      description = "Catppuccin accent color to use across themed modules.";
    };
  };
}
