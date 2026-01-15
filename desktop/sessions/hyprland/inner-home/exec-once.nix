{ ... }:

let
  cliphistWatch = "wl-paste --watch cliphist store";
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [ cliphistWatch ];
  };
}
