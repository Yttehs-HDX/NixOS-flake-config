{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "networking";
  };

  hosts = config.profile.hosts or { };
  hostProfile =
    if hosts == { } then { } else builtins.head (builtins.attrValues hosts);
  hostName = hostProfile.host.hostname or "nixos";
in mkSystemSoftware {
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
