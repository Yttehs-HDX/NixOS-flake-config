{
  description = "Shetty Yttehs's NixOS flake";

  inputs = {
    # Nix packages
    nixpkgs = { url = "github:nixos/nixpkgs?ref=nixos-25.11"; };

    # Home Manager (for managing users)
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix user repository (NUR)
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hexecute (Custom utility for magic power)
    hexecute = { url = "github:ThatOtherAndrew/Hexecute"; };

    # NixVim (Custom NixOS Vim configuration)
    nixvim = { url = "github:nix-community/nixvim/nixos-25.11"; };
  };

  outputs = { self, nixpkgs, nur, home-manager, hexecute, nixvim, ... }:
    let
      lib = nixpkgs.lib;
      users = import ./users { };
      hosts = import ./hosts {
        inherit lib nur home-manager hexecute nixvim users;
      };
    in {
      nixosConfigurations = hosts.nixosConfigurations;
    };
}
