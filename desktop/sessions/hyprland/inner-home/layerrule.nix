{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      # Rofi
      "blur,rofi"
      "ignorezero,rofi"

      # Waybar
      "blur,waybar"
      "ignorezero,waybar"
    ];
  };
}
