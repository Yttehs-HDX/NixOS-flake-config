{ username }:

{
  imports = [
    ./global
    ../desktop/home.nix
    ./options.nix
    ./software
    ../hosts/options.nix
    ../users/options.nix
    (import ./global/user.nix { inherit username; })
  ];
}
