{ lib, profile, ... }:

let
  hostName = profile.host.name or "nixos";
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
