{ config, ... }:

let
  username = "shetty";
  userProfile = config.profile.users.${username} or { };
in {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
  };

  home.stateVersion = "25.11";
}
