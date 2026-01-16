{ lib, ... }:

let
  hostSubmodule = { ... }: {
    imports = [
      ../system/options.nix
    ];

    options.host = {
      hostname = lib.mkOption {
        type = lib.types.str;
        description = "Profile hostname.";
      };
      users = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Profile users for the host.";
      };
      system = lib.mkOption {
        type = lib.types.str;
        description = "Profile system (e.g. x86_64-linux).";
      };
    };

    options.system = lib.mkOption {
      type = lib.types.submodule {
        options = {};
      };
      default = {};
      description = "Profile system settings.";
    };
  };
in
{
  options.profile.hosts = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule hostSubmodule);
    default = {};
    description = "Per-host profile definitions.";
  };
}
