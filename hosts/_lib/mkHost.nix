{ lib, nur, home-manager, hexecute, nixvim, users }:
{ system, hostProfile, hostModule, hostKey }:

let
  hostname = hostProfile.host.hostname;
  hostUsers = hostProfile.host.users;

  userProfilesAttr = lib.genAttrs hostUsers (name: users { inherit name; });

  profileModule = {
    config.profile = {
      hosts.${hostname} = hostProfile;
      users = userProfilesAttr;
    };
  };

  home = import ../../home;
  homeManagerUsers = lib.genAttrs hostUsers (name: home { username = name; });

  nixosModules = [
    nur.modules.nixos.default

    ../options.nix
    ../../users/options.nix
    ../../system/default.nix
    hostModule
    profileModule

    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useUserPackages = true;
        backupFileExtension = "hm-backup";

        sharedModules = [ nixvim.homeModules.nixvim profileModule ];

        users = homeManagerUsers;

        extraSpecialArgs = {
          nur = nur.legacyPackages.${system}.repos;
          inherit hexecute nixvim;
        };
      };
    }
  ];
in lib.nixosSystem {
  inherit system;
  specialArgs = { };
  modules = nixosModules;
}
