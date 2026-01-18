{ username }:

{ lib, config, ... }:

let
  actualUsername = config.profile.users.${username}.user.username;
in {
  home = {
    username = actualUsername;
    homeDirectory = "/home/${actualUsername}";
    stateVersion = "25.11";
  };
}
