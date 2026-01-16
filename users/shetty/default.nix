{ profile, ... }:

let
  username = profile.user.name;
in {
  nixpkgs.config.allowUnfree = true;

  home = {
    username = username;
    homeDirectory = "/home/${username}";
  };

  home.stateVersion = "25.11";
}
