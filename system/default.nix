{ lib, nur, home-manager, hexecute, nixvim, ... }:
{ hostname, profiles }:

let
  hosts = import ../hosts;
  hostEntry = hosts.${hostname} or (throw "Host ${hostname} not found");
  hostHardwareConfig = hostEntry.hardwareConfig;

  hostProfile = profiles.hosts.${hostname};
  system = hostProfile.host.system;
in lib.nixosSystem {
  inherit system;
  specialArgs = { inherit hostname nur hexecute nixvim system; };
  modules = [
    ({ ... }: { config.profile = profiles; })

    hostHardwareConfig

    home-manager.nixosModules.home-manager
    nur.modules.nixos.default

    ./home-aux
    ./software
    ./global
    ../desktop/nixos.nix

    ./options.nix
  ];
}
