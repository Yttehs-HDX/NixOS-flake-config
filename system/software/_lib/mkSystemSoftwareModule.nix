{ lib, config, name, hostname }:

let
  hosts = config.profile.hosts or { };
  hostProfile = hosts.${hostname} or { };
  systemProfile = hostProfile.system or { };
  sw = systemProfile.software or { };
  item = sw.${name} or { };
  enabled = item.enable or false;
in cfg:
let
  imports = cfg.imports or [ ];
  configWithoutImports = builtins.removeAttrs cfg [ "imports" ];
in {
  inherit imports;
  config = lib.mkIf enabled configWithoutImports;
}
