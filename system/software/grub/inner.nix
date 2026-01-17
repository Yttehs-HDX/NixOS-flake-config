{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "grub";
  };
in mkSystemSoftware {

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      # efiInstallAsRemovable = true;
      device = "nodev";
    };
  };
}
