{ lib, nur, home-manager, hexecute, nixvim, users }:
{ system, hostProfile, hostModule, hostKey }:

let
  hostname = hostProfile.host.hostname;
  hostUsers = hostProfile.host.users;

  userProfilesAttr = lib.genAttrs hostUsers
    (name: (users.${name} or (throw "User ${name} not found")).profile);

  profileModule = {
    config.profile = {
      hosts.${hostname} = hostProfile;
      users = userProfilesAttr;
    };
  };

  mkHomeManagerModule = import ../../home/_lib/mkHomeManagerModule.nix;
  homeManagerUsers = lib.genAttrs hostUsers (name:
    let username = (users.${name} or (throw "User ${name} not found")).username;
    in { imports = [ (mkHomeManagerModule { inherit username; }) ]; });

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
        sharedModules = [
          nixvim.homeModules.nixvim
          ../../home
          ../options.nix
          ../../users/options.nix
          profileModule
        ];

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
