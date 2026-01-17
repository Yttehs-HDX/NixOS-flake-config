{ lib, ... }:

let
  toggleItem = lib.types.submodule ({ ... }: {
    options.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable a desktop feature in the profile.";
    };
  });
in {
  options.desktop.sessions = lib.mkOption {
    type = lib.types.attrsOf toggleItem;
    default = { };
    description = "Profile desktop sessions.";
  };
}
