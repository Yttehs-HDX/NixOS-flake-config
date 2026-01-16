{ ... }:

{
  defaultUsers = [ "shetty" ];

  profiles = {
    shetty = import ./shetty/profile.nix { };
  };

  modules = {
    shetty = ./shetty;
  };
}
