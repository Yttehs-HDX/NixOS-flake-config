{ username }:

{
  imports = [
    ./global
    ../desktop/home.nix
    ./options.nix
    ./software
    (import ./global/user.nix { inherit username; })
  ];
}
