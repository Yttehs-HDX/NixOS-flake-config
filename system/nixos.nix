{ ... }:

{
  imports = [
    ./nix.nix
    ./boot.nix
    ./networking.nix
    ./locale.nix
    ./zram.nix
    ./packages.nix
    ./services.nix
    ./hardware.nix
    ./users.nix
    ./programs.nix
    ./virtualisation.nix
    ./home-aux
  ];
}
