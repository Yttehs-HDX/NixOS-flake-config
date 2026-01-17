{ lib, ... }:

let
  hostSubmodule = lib.types.submodule {
    imports = [ ../system/options.nix ];

    options.host = {
      hostname = lib.mkOption {
        type = lib.types.str;
        description = "Profile hostname.";
      };
      users = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
        description = "Users assigned to this host.";
      };
      system = lib.mkOption {
        type = lib.types.str;
        description = "Profile system (e.g. x86_64-linux).";
      };
    };
  };
in {
  options.profile.hosts = lib.mkOption {
    type = lib.types.attrsOf hostSubmodule;
    default = { };
    description = "Host profiles indexed by hostname.";
  };
}
