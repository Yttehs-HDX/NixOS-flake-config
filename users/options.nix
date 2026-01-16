{ lib, ... }:

let
  userSubmodule = { ... }: {
    imports = [ ../desktop/options.nix ../home/options.nix ];

    options.user = {
      username = lib.mkOption {
        type = lib.types.str;
        description = "Profile username.";
      };
      description = lib.mkOption {
        type = lib.types.str;
        description = "Profile user description.";
      };
      isSuper = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether the profile user is a superuser.";
      };
    };
  };
in {
  options.profile.users = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule userSubmodule);
    default = { };
    description = "Per-user profile definitions.";
  };
}
