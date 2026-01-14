{ pkgs, ... }:

{
  imports = [
    ../aux/home.nix
    ./variables.nix
    ./exec-once.nix
    (import ./bindings.nix { inherit pkgs; })
    ./xwayland.nix
    ./general.nix
    ./decoration.nix
    ./animations.nix
    ./layerrule.nix
    ./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
