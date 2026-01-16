{ ... }:

{
  imports = [
    # Hardware scan (auto generated)
    ./hardware-configuration.nix
    ../../system/default.nix
    ../../desktop/nixos.nix
  ];

  system.stateVersion = "25.11"; # Did you read the comment?
}
