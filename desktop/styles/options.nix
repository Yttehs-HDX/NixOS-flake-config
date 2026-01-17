{ lib, config, ... }:

let
  username = config.home.username or null;
  userProfile =
    if username != null then config.profile.users.${username} or { } else { };
  desktopStyle = (userProfile.desktop or { }).style or { };
in {
  imports = [ ./themes/options.nix ./fonts/options.nix ];

  options._derivedStyle = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = { };
    internal = true;
    description = "Derived style config from user's profile.";
  };

  config._derivedStyle = desktopStyle;
}
