{ ... }:

let toggleMuteCmd = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
in {
  programs.waybar.settings.main = {
    "group/monitor" = {
      orientation = "horizontal";
      modules = [ "cpu" "memory" "backlight" "pulseaudio" ];
    };
    cpu = {
      interval = 10;
      format = "  {usage}";
    };
    memory = {
      interval = 30;
      format = "  {percentage}";
      max-length = 10;
    };
    backlight = {
      format = "{icon} {percent}";
      format-icons = [ " " " " " " " " " " " " " " " " " " ];
    };
    pulseaudio = {
      format = "{icon} {volume}";
      format-bluetooth = "  {volume}";
      format-muted = " ";
      format-icons = { default = [ "" " " " " ]; };
      on-click = toggleMuteCmd;
    };
  };
}
