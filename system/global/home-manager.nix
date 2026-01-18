{ lib, config, nur, hexecute, nixvim, system, ... }:

let
  profile = { users = config.profile.users or { }; };
  home = import ../../home;
  userProfiles = profile.users;
  mkHomeUser = _: userProfile: {
    name = userProfile.user.username;
    value = home { username = userProfile.user.username; };
  };
  homeManagerUsers = lib.mapAttrs' mkHomeUser userProfiles;
in {
  home-manager = {
    useUserPackages = true;
    backupFileExtension = "hm-backup";

    sharedModules = [
      nixvim.homeModules.nixvim
      ({ config, ... }: { config.profile = profile; })
    ];

    users = homeManagerUsers;

    extraSpecialArgs = {
      nur = nur.legacyPackages.${system}.repos;
      inherit (config) profile;
      inherit hexecute nixvim;
    };
  };
}
