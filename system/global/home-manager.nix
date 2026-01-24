{ lib, config, nur, hexecute, nixvim, system, hostname, ... }:

let
  lookup = import ../../_lib/getProfile.nix { inherit lib; };
  integrated = lookup.getHostIntegratedProfile config hostname;
  profiles = { users = integrated.users; };
  home = import ../../home;
  userProfiles = integrated.users;
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
      ({ config, ... }: { config.profile = profiles; })
    ];

    users = homeManagerUsers;

    extraSpecialArgs = {
      nur = nur.legacyPackages.${system}.repos;
      inherit hexecute nixvim;
    };
  };
}
