{
  description = "Shetty Yttehs's NixOS flake";

  inputs = {
    # Nix packages
    nixpkgs = { url = "github:nixos/nixpkgs?ref=nixos-25.11"; };

    # Home Manager (for managing users)
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # Sync with `nixpkgs`
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix user repository (NUR)
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hexecute
    hexecute = { url = "github:ThatOtherAndrew/Hexecute"; };

    # NixVim
    nixvim = { url = "github:nix-community/nixvim/nixos-25.11"; };
  };

  outputs = { self, nixpkgs, nur, home-manager, hexecute, nixvim, ... }:
    let
      system = "x86_64-linux";
      profile = import ./users/shetty/profile.nix { };
    in {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            nur.modules.nixos.default

            ./hosts/laptop/configuration.nix
            ./hosts/laptop/hardware-configuration.nix

            # Mark Home Manager as a submodule
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                # useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "hm-backup";
                sharedModules = (import ./modules/home-manager)
                  ++ [
                    ./home
                    ./desktop/home.nix
                  ];

                # Users begin
                users.shetty = import ./users/shetty/home.nix;

                # Pass extra arguments to home-manager modules
                extraSpecialArgs = {
                  nur = nur.legacyPackages.${system}.repos;
                  inherit hexecute nixvim;
                  inherit profile;
                };
              };
            }
          ];
        };
      };
    };
}
