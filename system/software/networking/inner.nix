{ lib, config, hostname, ... }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  hostProfile = lookup.getHostProfile config hostname;
  hostName = (hostProfile.host or { }).hostname or "nixos";
in {
  networking = {
    inherit hostName;
    extraHosts = ''
      127.0.0.1 localhost
      ::1 localhost
      127.0.0.1 ${hostName}.local
    '';
    networkmanager.enable = true;
  };
}
