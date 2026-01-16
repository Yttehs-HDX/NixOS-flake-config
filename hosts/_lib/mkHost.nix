{ lib, nur, home-manager, hexecute, nixvim, users }:
{ system, hostProfile, hostModule, hostKey }:

let
  hostUsers = lib.attrByPath [ "host" "users" ] users.defaultUsers hostProfile;
  userProfiles = lib.genAttrs hostUsers (name: users.profiles.${name});
  userProfile =
    lib.foldl' lib.recursiveUpdate { } (builtins.attrValues userProfiles);
  profile = lib.recursiveUpdate userProfile hostProfile;
  hostProfiles = { ${hostKey} = hostProfile; };
  profileModule = {
    config.profile = {
      users = userProfiles;
      hosts = hostProfiles;
    };
  };
  userProfileModule =
    import ../../users/_lib/mkUserProfileModule.nix { profile = userProfiles; };
  homeManagerUsers =
    lib.genAttrs hostUsers (name: import users.modules.${name});
  nixosModules = [
    nur.modules.nixos.default

    ../options.nix
    ../../users/options.nix
    ../../system/default.nix
    hostModule
    profileModule
    userProfileModule

    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useUserPackages = true;
        backupFileExtension = "hm-backup";
        sharedModules = [
          ../../home
          ../options.nix
          ../../users/options.nix
          profileModule
          userProfileModule
        ];

        users = homeManagerUsers;

        extraSpecialArgs = {
          nur = nur.legacyPackages.${system}.repos;
          inherit hexecute nixvim;
          inherit profile;
        };
      };
    }
  ];
in lib.nixosSystem {
  inherit system;
  specialArgs = { inherit profile; };
  modules = nixosModules;
}
