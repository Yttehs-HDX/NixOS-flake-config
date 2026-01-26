{ lib, config, hostname ? null, name }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  hostProfile =
    if hostname != null then lookup.getHostProfile config hostname else { };
  desktop = hostProfile.desktop or { };
  dm = desktop.dm or { };
  item = if name == null then { } else (dm.${name} or { });
  enabled = (hostname != null) && (desktop.enable or false)
    && (item.enable or false);
in cfg:
let
  imports = cfg.imports or [ ];
  configWithoutImports = builtins.removeAttrs cfg [ "imports" ];
in {
  inherit imports;
  config = lib.mkIf enabled configWithoutImports;
}
