{ config, ... }:

let
  profileUsers = config.profile.users or { };
  userNames = builtins.attrNames profileUsers;
in {
  programs.adb.enable = true;
  users.groups.adbusers.members = userNames;
}
