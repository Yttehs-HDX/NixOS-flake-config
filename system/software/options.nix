{ lib, ... }:

let
  softwareSubmodule = lib.types.submodule ({ ... }: {
    options.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable a system software package in the profile.";
    };
  });
in
{
  options.system.software = lib.mkOption {
    type = lib.types.attrsOf softwareSubmodule;
    default = {};
    description = "Profile toggles for system software packages.";
  };
}
