{ config, lib, pkgs, ... }:

let coreModules = import ../../modules/core;
in {
  imports = [
    # Hardware scan (auto generated)
    ./hardware-configuration.nix
  ] ++ coreModules ++ [
    ../../desktop/nixos.nix
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
