{ ... }:

{
  programs.waybar.settings.main = {
    "group/hyprland" = {
      orientation = "horizontal";
      modules = [ "hyprland/workspaces" "hyprland/window" ];
    };
    "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
      active-only = false;
      format = "{icon}";
      format-icons = {
        "1" = "壱";
        "2" = "弐";
        "3" = "参";
        "4" = "肆";
        "5" = "伍";
        "6" = "陸";
        "7" = "漆";
        "8" = "捌";
        "9" = "玖";
        "10" = "拾";
      };
      on-click = "activate";
      persistent-workspaces = { "*" = [ 1 2 3 4 5 6 ]; };
    };
    "hyprland/window" = {
      format = "{class}";
      icon = true;
      icon-size = 15;
    };
  };
}
