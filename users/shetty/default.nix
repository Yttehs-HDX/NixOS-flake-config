{ ... }:

{
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "shetty";
    homeDirectory = "/home/shetty";
  };

  home.stateVersion = "25.11";
}
