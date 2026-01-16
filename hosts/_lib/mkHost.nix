{ lib, nur, home-manager, hexecute, nixvim, users, homeModules }:
{ system, hostProfile, hostModule }:

let
  hostUsers = lib.attrByPath [ "host" "users" ] users.defaultUsers hostProfile;
  userProfile = lib.foldl' lib.recursiveUpdate { }
    (map (name: users.profiles.${name}) hostUsers);
  profile = lib.recursiveUpdate userProfile hostProfile;
  homeManagerUsers = lib.genAttrs hostUsers
    (name: import users.modules.${name});
  nixosModules = [
    nur.modules.nixos.default

    hostModule

    home-manager.nixosModules.home-manager {
      home-manager = {
        useUserPackages = true;
        backupFileExtension = "hm-backup";
        sharedModules = homeModules;

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
  specialArgs = {
    inherit profile;
  };
  modules = nixosModules;
}
