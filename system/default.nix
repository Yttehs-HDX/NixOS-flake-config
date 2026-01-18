{ lib, nur, home-manager, hexecute, nixvim }:
{ hostname }:

let
  hostsPath = ../hosts;
  homePath = ../home;

  hosts = import ../hosts;
  hostHardwareConfig = (hosts { name = hostname; }).hardwareConfig;

  mkProfile = import ./_lib/mkProfile.nix { inherit lib; };
  profile = mkProfile { inherit hostname; };
  hostProfile = profile.hosts.${hostname};
  system = hostProfile.host.system;
in lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit profile;
    inherit hostname nur hexecute nixvim system;
  };
  modules = [
    home-manager.nixosModules.home-manager
    nur.modules.nixos.default

    hostHardwareConfig

    ../users/options.nix
    ../home/options.nix
    ../hosts/options.nix
    ../system/options.nix
    ../desktop/options.nix

    ./injections

    ./home-aux
    ./software
    ./global

    ../desktop/nixos.nix
  ];
}
