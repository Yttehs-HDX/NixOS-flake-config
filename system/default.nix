{ lib, nur, home-manager, hexecute, nixvim, self }:
{ hostname }:

let
  hostsPath = self + "/hosts";
  homePath = self + "/home";
  usersPath = self + "/users";

  hosts = import hostsPath;
  hostHardwareConfig = (hosts { name = hostname; }).hardwareConfig;

  mkProfile = import ./_lib/mkProfile.nix { inherit lib hostsPath usersPath; };
  profile = mkProfile { inherit hostname; };
  hostProfile = profile.hosts.${hostname};
  system = hostProfile.host.system;
in lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit profile;
    inherit homePath hostsPath;
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

    ./home-aux
    ./software
    ./global

    ../desktop/nixos.nix
  ];
}
