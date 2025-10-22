{
  description = "Shetty Yttehs's NixOS flake";

  inputs = {
    # Nix packages
    nixpkgs = { url = "github:nixos/nixpkgs?ref=nixos-25.05"; };

    # Home Manager (for managing users)
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # Sync with `nixpkgs`
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hexecute
    hexecute = { url = "github:ThatOtherAndrew/Hexecute"; };
  };

  outputs = { self, nixpkgs, home-manager, hexecute, ... }:
    let system = "x86_64-linux";
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
                sharedModules = import ./modules/home-manager;

                # Users begin
                users.shetty = import ./users/shetty/home.nix;

                # Pass extra arguments to home-manager modules
                extraSpecialArgs = { inherit hexecute; };
              };
            }
          ];
        };
      };
    };
}

