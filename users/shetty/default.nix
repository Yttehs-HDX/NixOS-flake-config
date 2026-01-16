{ config, ... }:

let
  username = config.profile.users.shetty.user.username;
in {
  nixpkgs.config.allowUnfree = true;

  home = {
    username = username;
    homeDirectory = "/home/${username}";
  };

  home.stateVersion = "25.11";
}
