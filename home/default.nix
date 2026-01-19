{ username, ... }:

{
  _module.args = { inherit username; };
  imports =
    [ ./global ../desktop/home.nix ./options.nix ./software ./global/user.nix ];
}
