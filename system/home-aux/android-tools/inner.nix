{ config, lib, profile, ... }:

let
  # Get all users who have android-tools enabled
  userProfiles = profile.users or {};
  enabledUsers = lib.filter (name: 
    let
      userProfile = userProfiles.${name};
      home = userProfile.home or {};
      sw = home.software or {};
      androidTools = sw.android-tools or {};
    in androidTools.enable or false
  ) (builtins.attrNames userProfiles);
in
{
  programs.adb.enable = (builtins.length enabledUsers) > 0;
  users.groups.adbusers.members = enabledUsers;
}
