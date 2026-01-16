{ lib, profile, name, inner }:

let
  systemProfile = profile.system or {};
  sw = systemProfile.software or {};
  item = sw.${name} or {};
  enabled = item.enable or false;
in
{
  imports = lib.optionals enabled [
    inner
  ];
}
