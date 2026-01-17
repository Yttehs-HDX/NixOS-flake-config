{ config, lib, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config;
    name = "android-tools";
  };

  profileUsers = config.profile.users or { };
  userNames = builtins.attrNames profileUsers;
in mkHomeAux {
  programs.adb.enable = true;
  users.groups.adbusers.members = userNames;
}
