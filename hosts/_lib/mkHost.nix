{ lib, nur, home-manager, hexecute, nixvim, users }:
{ system, hostProfile, hostModule, hostKey }:

let
  hostname = hostProfile.host.hostname;
  hostUsers = hostProfile.host.users;

  userProfilesAttr = lib.genAttrs hostUsers (name:
    users.profiles.${name} or (throw
      "User ${name} not found in user profiles"));

  profileModule = {
    config.profile = {
      hosts.${hostname} = hostProfile;
      users = userProfilesAttr;
    };
  };

  homeManagerUsers = lib.genAttrs hostUsers (name:
    users.homeManagerUsers.${name} or (throw
      "Home-manager config for ${name} not found"));

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
