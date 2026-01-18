{ username }:

{ lib, ... }:

{
  home = {
    inherit username;
    homeDirectory = lib.mkDefault "/home/${username}";
    stateVersion = lib.mkDefault "25.11";
  };
}
