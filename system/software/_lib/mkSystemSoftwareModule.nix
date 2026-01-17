# mkSystemSoftwareModule: Creates a module that conditionally applies config based on host profile
# Usage in inner module:
#   { config, lib, ... }:
#   let mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix { inherit lib config; name = "xxx"; };
#   in mkSystemSoftware { services.xxx.enable = true; }
{ lib, config, name }:

let
  hosts = config.profile.hosts or { };
  hostProfile =
    if hosts == { } then { } else builtins.head (builtins.attrValues hosts);
  systemProfile = hostProfile.system or { };
  sw = systemProfile.software or { };
  item = sw.${name} or { };
  enabled = item.enable or false;
in cfg: { config = lib.mkIf enabled cfg; }
