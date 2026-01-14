{ ... }:

let
  cliphistWatch = "wl-paste --watch cliphist store";
  clashVerge = "clash-verge";
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [ cliphistWatch clashVerge ];
  };
}
