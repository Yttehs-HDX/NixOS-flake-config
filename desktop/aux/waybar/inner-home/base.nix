{ ... }:

{
  programs.waybar.settings.main = {
    layer = "top";
    position = "top";
    mode = "dock";
    height = 32;
    exclusive = true;
    passthrough = false;
    gtk-layer-shell = true;
    ipc = true;
    fixed-center = true;
    margin-top = 5;
    margin-left = 5;
    margin-right = 5;
    margin-bottom = 0;

    modules-left = [ "group/hyprland" "cava" ];
    modules-center = [ "group/misc" ];
    modules-right =
      [ "group/monitor" "group/connection" "group/menu" "group/custom" ];
  };
}
