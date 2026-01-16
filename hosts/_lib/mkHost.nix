{ lib, nur, home-manager, hexecute, nixvim, users, homeModules }:
{ system, hostProfile, hostModule }:

let
  hostUsers = lib.attrByPath [ "host" "users" ] users.defaultUsers hostProfile;
  
  # Create individual profiles for each user (user profile + host profile)
  userProfiles = lib.genAttrs hostUsers
    (name: lib.recursiveUpdate users.profiles.${name} hostProfile);
  
  # Generate home-manager user configurations
  homeManagerUsers = lib.genAttrs hostUsers
    (name: import users.modules.${name});
  
  # For system-level modules, merge all user profiles but keep them identifiable
  # This allows system modules to check what any user has enabled
  allUsersProfile = lib.foldl' lib.recursiveUpdate { }
    (map (name: users.profiles.${name}) hostUsers);
  systemProfile = lib.recursiveUpdate
    (lib.recursiveUpdate allUsersProfile hostProfile)
    {
      # Add a users attribute containing individual user profiles
      users = lib.genAttrs hostUsers (name: users.profiles.${name});
    };
  
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
        };
      };
    }
    
    # Pass individual user profiles to each user's home-manager config
    {
      home-manager.users = lib.mapAttrs (name: _: {
        _module.args.profile = userProfiles.${name};
      }) homeManagerUsers;
    }
  ];
in lib.nixosSystem {
  inherit system;
  specialArgs = {
    profile = systemProfile;
  };
  modules = nixosModules;
}
