{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      shadow.enabled = false;
      rounding = 10;
      dim_special = 0.3;
      blur = {
        enabled = true;
        special = true;
        size = 6;
        passes = 2;
        new_optimizations = true;
        ignore_opacity = true;
        xray = false;
      };
    };
  };
}
