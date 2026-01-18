{ lib, config, nur, hexecute, nixvim, homePath, system, ... }:

let
  profile = config.profile;
  home = import homePath;
  userProfiles = config.profile.users or { };
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
