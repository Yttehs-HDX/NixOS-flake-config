{ lib, profile, name, inner }:

let
  desktop = profile.desktop or {};
  sessions = desktop.sessions or {};
  item = sessions.${name} or {};
  enabled = (desktop.enable or false) && (item.enable or false);
in
{
  imports = lib.optionals enabled [
    inner
  ];
}
