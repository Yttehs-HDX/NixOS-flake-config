{ lib, nur, home-manager, hexecute, nixvim, users, hosts }:

let
  mkSystem = { hostname }:
    let
      hostRegistry = import ../hosts/registry.nix { };
      hostEntry = hostRegistry.${hostname}
        or (throw "Host ${hostname} not found");
      hostProfile = hostEntry.profile;
      system = hostProfile.host.system;
      hostUsers = hostProfile.host.users;
      hardwareConfig = hostEntry.hardwareConfig;

      userProfilesAttr = lib.genAttrs hostUsers (name: users { inherit name; });

      profileModule = {
        config.profile = {
          hosts.${hostProfile.host.hostname} = hostProfile;
          users = userProfilesAttr;
        };
      };

      home = import ../home;
      homeManagerUsers =
        lib.genAttrs hostUsers (name: home { username = name; });

      nixosModules = [
        nur.modules.nixos.default

        ../hosts/options.nix
        ../users/options.nix
        ./global
        ../desktop/nixos.nix
        ./home-aux
        ./software
        hardwareConfig
        profileModule

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            backupFileExtension = "hm-backup";

            sharedModules = [ nixvim.homeModules.nixvim profileModule ];

            users = homeManagerUsers;

            extraSpecialArgs = {
              nur = nur.legacyPackages.${system}.repos;
              inherit hexecute nixvim;
            };
          };
        }
      ];
    in lib.nixosSystem {
      inherit system;
      specialArgs = { };
      modules = nixosModules;
    };
in { hostname }: mkSystem { inherit hostname; }
