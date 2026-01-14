{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings.plugin = {
      overview = {
        drawActiveWorkspace = false;
        overrideAnimSpeed = 3.5;
        gapsIn = 2;
        gapsOut = 4;
        panelColor = "rgba(1e1e2ecc)";
        workspaceBorderSize = 2;
        workspaceActiveBorder = "rgba(f2d5cfff)";
        workspaceInactiveBorder = "rgba(6c7086ff)";
      };

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
      hyprlandPlugins.hyprspace
      hyprlandPlugins.hyprexpo
      hyprlandPlugins.hypr-dynamic-cursors
    ];
  };
}
