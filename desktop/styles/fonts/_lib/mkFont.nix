{ lib, profile, inner }:

let
  desktop = profile.desktop or {};
  enabled = desktop.enable or false;
in
{
  imports = lib.optionals enabled [
    inner
  ];
}
