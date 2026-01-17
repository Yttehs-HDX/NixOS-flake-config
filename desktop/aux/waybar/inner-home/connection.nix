{ ... }:

{
  programs.waybar.settings.main = {
    "group/connection" = {
      orientation = "horizontal";
      modules = [ "network" "bluetooth" ];
    };
    network = {
      interface = "wlo1";
      format = "{icon}";
      format-icons = {
        wifi = [ "󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 " ];
        ethernet = [ "󰈀 " ];
        disconnected = [ "󰤭 " ];
      };
      tooltip-format-wifi = "{essid} ({signalStrength}%)";
      tooltip-format-ethernet = "{ifname}";
      tooltip-format-disconnected = "Disconnected";
    };
    bluetooth = {
      format = "";
      format-disabled = "󰂲";
      format-connected = "󰂱";
      tooltip-format = "{controller_alias}";
      tooltip-format-connected = "{device_enumerate}";
      tooltip-format-off = "Off";
      tooltip-format-disabled = "Off";
      tooltip-format-enumerate-connected =
        "{device_alias}	{device_battery_percentage}%";
    };
  };
}
