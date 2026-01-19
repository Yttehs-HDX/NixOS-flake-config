{ lib, ... }:

let
  userSubmodule = lib.types.submodule {
    imports = [
      ./software/options.nix
      ../desktop/options.nix
      ../desktop/aux/options.nix
    ];

    options.user = {
      username = lib.mkOption {
        type = lib.types.str;
        description = "Profile username.";
      };
      description = lib.mkOption {
        type = lib.types.str;
        default = "";
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
    type = lib.types.attrsOf userSubmodule;
    default = { };
    description = "User profiles indexed by directory name.";
  };
}
