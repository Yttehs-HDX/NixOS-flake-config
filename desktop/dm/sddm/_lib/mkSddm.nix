{ lib, config }:

let
  profileUsers = config.profile.users or { };
  userName = if config ? home && config.home ? username then
    config.home.username
  else if profileUsers == { } then
    null
  else
    builtins.head (builtins.attrNames profileUsers);
  userProfile =
    if userName == null then { } else (profileUsers.${userName} or { });
  desktop = userProfile.desktop or { };
  dm = desktop.dm or { };
  sddm = dm.sddm or { };
  enabled = (desktop.enable or false) && (sddm.enable or false);
in mkConfig: lib.mkIf enabled (mkConfig { inherit desktop dm sddm enabled; })
