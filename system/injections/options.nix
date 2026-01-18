{ lib, ... }:

{
  options.profile = lib.mkOption {
    type = lib.types.submodule { };
    default = { };
    description = "Profile data for the system.";
  };
}
