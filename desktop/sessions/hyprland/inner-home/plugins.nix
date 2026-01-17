{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings.plugin = {
      hyprexpo = {
        columns = 3;
        gap_size = 4;
        bg_col = "rgba(1e1e2ecc)";
        workspace_method = "center current";

        gesture_distance = 300;
      };

      dynamic-cursors = {
        enabled = true;
        mode = "tilt";
      };
    };

    plugins = with pkgs; [
      hyprlandPlugins.hyprexpo
      hyprlandPlugins.hypr-dynamic-cursors
    ];
  };
}
