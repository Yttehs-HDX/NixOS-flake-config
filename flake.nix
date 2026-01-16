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
      # Layer 1: registry + library
      lib = nixpkgs.lib;
      registry = {
        hosts = import ./hosts { };
        users = import ./users { };
      };

      # Layer 2: selection
      selection = {
        host = registry.hosts.defaultHost;
        users = registry.users.defaultUsers;
      };

      # Layer 3: resolved targets
      system = registry.hosts.systems.${selection.host};
      hostProfile = registry.hosts.profiles.${selection.host};
      userProfile = lib.foldl' lib.recursiveUpdate { }
        (map (name: registry.users.profiles.${name}) selection.users);
      profile = lib.recursiveUpdate userProfile hostProfile;
      homeManagerUsers = lib.genAttrs selection.users
        (name: import registry.users.modules.${name});

      # Layer 4: module graph
      nixosModules = [
        nur.modules.nixos.default

        registry.hosts.modules.${selection.host}

        home-manager.nixosModules.home-manager {
          home-manager = {
            useUserPackages = true;
            backupFileExtension = "hm-backup";
            sharedModules = [
              ./home
              ./desktop/home.nix
            ];

            users = homeManagerUsers;

            extraSpecialArgs = {
              nur = nur.legacyPackages.${system}.repos;
              inherit hexecute nixvim;
              inherit profile;
            };
          };
        }
      ];
    in {
      # Layer 5: outputs
      nixosConfigurations = {
        ${selection.host} = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit profile;
          };
          modules = nixosModules;
        };
      };
    };
}
