{ lib, config, name }:

let
  userProfiles = config.profile.users or { };
  anyUserEnabled = lib.any (userProfile:
    let
      desktop = userProfile.desktop or { };
      sessions = desktop.sessions or { };
      item = sessions.${name} or { };
    in (desktop.enable or false) && (item.enable or false))
    (builtins.attrValues userProfiles);
in cfg:
let
  hasImports = cfg ? imports;
  imports = cfg.imports or [ ];
  configWithoutImports = builtins.removeAttrs cfg [ "imports" ];
in if hasImports then {
  inherit imports;
  config = lib.mkIf anyUserEnabled configWithoutImports;
} else {
  config = lib.mkIf anyUserEnabled cfg;
}
