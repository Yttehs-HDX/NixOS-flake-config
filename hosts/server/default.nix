{ ... }:

{
  imports = [
    ../../system/nixos.nix
    # Note: No desktop/nixos.nix import - this is a server without desktop
  ];

  system.stateVersion = "25.11";
}
