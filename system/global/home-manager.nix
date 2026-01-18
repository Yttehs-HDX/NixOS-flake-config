{ lib, config, nur, hexecute, nixvim, homePath, ... }:

let
  systemProfile = config.profile;
  home = import homePath;
  userProfiles = config.profile.users or { };
  mkHomeUser = _: userProfile: {
    name = userProfile.user.username;
    value = home { username = userProfile.user.username; };
  };
  homeManagerUsers = lib.mapAttrs' mkHomeUser userProfiles;

  hostProfiles = config.profile.hosts or { };
  hostProfile = if hostProfiles == { } then
    null
  else
    lib.head (builtins.attrValues hostProfiles);
  system = if hostProfile == null then
    (throw "Host profile not found")
  else
    hostProfile.host.system;
in {
  home-manager = {
    useUserPackages = true;
    backupFileExtension = "hm-backup";

    sharedModules = [
      nixvim.homeModules.nixvim
      ({ config, ... }: { config.profile = systemProfile; })
    ];

    users = homeManagerUsers;

    extraSpecialArgs = {
      nur = nur.legacyPackages.${system}.repos;
      profile = config.profile;
      inherit hexecute nixvim;
    };
  };
}
