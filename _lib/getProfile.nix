{ lib }:

let
  getUserProfile = config: username:
    let users = config.profile.users or { };
    in if builtins.hasAttr username users then
      users.${username}
    else
      throw "profile.users missing user '${username}'";

  getHostProfile = config: hostname:
    let hosts = config.profile.hosts or { };
    in if builtins.hasAttr hostname hosts then
      hosts.${hostname}
    else
      throw "profile.hosts missing host '${hostname}'";

  getHostIntegratedProfile = config: hostname:
    let
      hostProfile = getHostProfile config hostname;
      hostUsers = hostProfile.users or (hostProfile.host or { }).users or [ ];
      users = config.profile.users or { };
      missing =
        builtins.filter (name: !(builtins.hasAttr name users)) hostUsers;
      _ = if missing == [ ] then
        null
      else
        throw ''
          host '${hostname}' references missing users: ${
            lib.concatStringsSep ", " missing
          }
        '';
      selectedUsers = lib.genAttrs hostUsers (name: getUserProfile config name);
    in {
      host = hostProfile;
      users = selectedUsers;
      usernames = hostUsers;
    };
in { inherit getUserProfile getHostProfile getHostIntegratedProfile; }
