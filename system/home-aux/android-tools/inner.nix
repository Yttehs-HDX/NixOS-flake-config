{ config, lib, profile, ... }:

let
  profileUserName = profile.user.name;
in
{
  programs.adb.enable = true;
  users.groups.adbusers.members = [ profileUserName ];
}
