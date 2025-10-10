{
  description = "Shetty Yttehs's NixOS flake";

  inputs = {
    # Nix packages
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-25.05";
    };

    # Home Manager (for managing users)
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # Sync with `nixpkgs`
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/laptop/configuration.nix
          ./hosts/laptop/hardware-configuration.nix

          # Mark Home Manager as a submodule
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              # useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-backup";

              # Users begin
              users.shetty = import ./users/shetty/home.nix;
            };
          }
        ];
      };
    };
  };
}

