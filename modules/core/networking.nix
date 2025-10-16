{ config, lib, pkgs, ... }:

let
  hostName = "Shetty-Laptop";
in {
  networking = {
    inherit hostName;
    extraHosts = ''
      127.0.0.1 localhost
      ::1 localhost
      127.0.0.1 ${hostName}.local
    '';
    networkmanager.enable = true;
    firewall.enable = false;
  };
}

