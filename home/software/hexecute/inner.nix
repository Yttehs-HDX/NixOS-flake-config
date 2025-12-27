{ pkgs, hexecute, ... }:

{
  home.packages = [ hexecute.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
