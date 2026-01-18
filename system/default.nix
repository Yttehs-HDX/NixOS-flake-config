{ lib, nur, home-manager, hexecute, nixvim, self }:
{ hostname }:

let
  hosts = import ../hosts;
  users = import ../users;

  hostEntry = hosts { name = hostname; };
  hostProfile = hostEntry.profile;
  hostHardwareConfig = hostEntry.hardwareConfig;
  hostUsers = hostProfile.host.users;

  userProfilesAttr = lib.genAttrs hostUsers (name: users { inherit name; });
  profile = {
    hosts.${hostProfile.host.hostname} = hostProfile;
    users = userProfilesAttr;
  };

  profileModule = { config.profile = profile; };
  nixosModules = [
    home-manager.nixosModules.home-manager
    nur.modules.nixos.default

    ../hosts/options.nix
    ../users/options.nix
    ./global
    ../desktop/nixos.nix
    ./home-aux
    ./software
    hostHardwareConfig
    profileModule
  ];
in lib.nixosSystem {
  inherit (hostProfile.host) system;
  specialArgs = {
    inherit profile;
    homePath = self + "/home";
    inherit hostname nur hexecute nixvim;
  };
  modules = nixosModules;
}
