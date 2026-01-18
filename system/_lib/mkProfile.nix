{ lib, hostsPath, usersPath }:
{ hostname }:

let
  hosts = import hostsPath;
  users = import usersPath;

  hostEntry = hosts { name = hostname; };
  hostProfile = hostEntry.profile;

  hostUsers = hostProfile.host.users;
  userProfilesAttr = lib.genAttrs hostUsers (name: users { inherit name; });
in {
  hosts.${hostProfile.host.hostname} = hostProfile;
  users = userProfilesAttr;
}
