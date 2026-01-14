{ ... }:

let
  hexecuteCmd = "hexecute";
  toggleNotificationCmd = "swaync-client -t";
in {
  programs.waybar.settings.main = {
    "group/menu" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 300;
        transition-left-to-right = false;
      };
      modules = [ "battery" "tray" "custom/hexecute" ];
    };
    tray = {
      icon-size = 15;
      spacing = 10;
    };
    battery = {
      interval = 60;
      states = {
        warning = 30;
        critical = 15;
      };
      format = "{icon}  {capacity}";
      format-icons = [ "󰁺" "󰁻" "󰁼" "󰁾" "󰁿" "󰂀" "󰂁" "󰂁" "󰂂" "󰁹" ];
      on-click = toggleNotificationCmd;
    };
    "custom/hexecute" = {
      format = " ";
      tooltip-format = "魔法使い";
      on-click = hexecuteCmd;
    };
  };
}
