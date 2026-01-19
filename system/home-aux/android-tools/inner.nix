{ usernames, ... }:

{
  programs.adb.enable = true;
  users.groups.adbusers.members = usernames;
}
