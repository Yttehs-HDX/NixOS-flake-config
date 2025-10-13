{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        # Generic
        layer = "top";
        position = "top";
        mode = "dock";
        height = 32;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        ipc = true;
        fixed-center = true;
        margin-top = 10;
        margin-left = 10;
        margin-right = 10;
        margin-bottom = 0;

        # Definitions
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
          "cava"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "cpu"
          "memory"
          "backlight"
          "pulseaudio"
          "tray"
          "battery"
        ];

        # Module settings
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          active-only = false;
          format = "{id}";
          on-click = "activate";
          persistent-workspaces = {
            "*" = [ 1 2 3 4 5 ];
          };
        };
        "hyprland/window" = {
          format = "{class}";
          icon = true;
          icon-size = 16;
        };
        cava = {
          hide_on_silence = true;
          framerate = 60;
          bars = 10;
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          input_delay = 1;
          sleep_timer = 5;
          bar_delimiter = 0;
          on-click = "playerctl play-pause";
        };
        clock = {
          format = "󰥔 {:%H:%M}";
          format-alt = "󰃭 {:%Y-%m-%d %A}";
          locale = "ja_JP.utf8";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
          };
          interval = 1;
          timezone = "Asia/Taipei";
        };
        cpu = {
          interval = 10;
          format = "  {usage}%";
        };
        memory = {
          interval = 30;
          format = "  {percentage}%";
          max-length = 10;
        };
        backlight = {
          format = "{icon} {percent}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };
        pulseaudio = {
          format = "{icon} {volume}";
          format-bluetooth = "  {volume}";
          format-muted = " ";
          format-icons = {
            default = [ " " " " " " ];
          };
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
          format = "{icon} {capacity}";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁾" "󰁿" "󰂀" "󰂁" "󰂁" "󰂂" "󰁹" ];
        };
      }
    ];
  };
}

