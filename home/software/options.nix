{ lib, ... }:

let
  softwareSubmodule = lib.types.submodule ({ ... }: {
    options.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable a home software package in the profile.";
    };
  });
in
{
  options.home.software = lib.mkOption {
    type = lib.types.attrsOf softwareSubmodule;
    default = {};
    description = "Profile toggles for home software packages.";
  };
}
