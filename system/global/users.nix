{ lib, config, ... }:

let
  profileUsers = config.profile.users or { };
  mkUser = _: userProfile: {
    name = userProfile.user.username;
    value = {
      isNormalUser = true;
      description = userProfile.user.description or "";
      extraGroups =
        lib.optionals (userProfile.user.isSuper or false) [ "wheel" ];
    };
  };
in { users.users = lib.mapAttrs' mkUser profileUsers; }
