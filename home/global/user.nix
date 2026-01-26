{ lib, config, username, ... }:

let
  lookup = import ../../_lib/getProfile.nix { inherit lib; };
  userProfile = lookup.getUserProfile config username;
  actualUsername = userProfile.user.username;
in {
  home = {
    username = actualUsername;
    homeDirectory = "/home/${actualUsername}";
  };
}
