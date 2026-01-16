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
      lib = nixpkgs.lib;
      homeModules = [
        ./home
        ./desktop/home.nix
      ];
      users = import ./users {
        inherit lib nixpkgs nur home-manager hexecute nixvim homeModules;
      };
      hosts = import ./hosts {
        inherit lib nur home-manager hexecute nixvim users;
        inherit homeModules;
      };
    in {
      nixosConfigurations = hosts.nixosConfigurations;
      homeConfigurations = users.homeConfigurations;
    };
}
