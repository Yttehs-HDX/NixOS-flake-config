{ lib, config, hostname, ... }:

let
  lookup = import ../../_lib/getProfile.nix { inherit lib; };
  integrated = lookup.getHostIntegratedProfile config hostname;
  userProfiles = integrated.users;
  mkUser = _: userProfile: {
    name = userProfile.user.username;
    value = {
      isNormalUser = true;
      description = userProfile.user.description or "";
      extraGroups =
        lib.optionals (userProfile.user.isSuper or false) [ "wheel" ];
      initialPassword = "test";
    };
  };
in { users.users = lib.mapAttrs' mkUser userProfiles; }
