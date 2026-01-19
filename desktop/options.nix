{ lib, ... }:

{
  imports = [ ./sessions/options.nix ./styles/options.nix ];

  options.desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable desktop features in the profile.";
  };
}
