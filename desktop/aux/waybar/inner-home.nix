{ config, ... }:

let
  palette = config.style.theme.palette;
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [{
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
      margin-top = 5;
      margin-left = 5;
      margin-right = 5;
      margin-bottom = 0;

      # Definitions
      modules-left = [ "group/hyprland" "cava" ];
      modules-center = [ "group/misc" ];
      modules-right =
        [ "group/monitor" "group/connection" "group/menu" "group/custom" ];

      # Module settings

      # Hyprland
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

      # Cava
      cava = {
        hide_on_silence = true;
        framerate = 60;
        bars = 8;
        format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        input_delay = 1;
        sleep_timer = 5;
        bar_delimiter = 0;
        on-click = "playerctl play-pause";
      };

      # Clock
      "group/misc" = {
        orientation = "horizontal";
        modules = [ "clock" "custom/lyric" ];
      };
      clock = {
        format = "󰥔  {:%H:%M}";
        format-alt = "󰃭  {:%Y-%m-%d %A}";
        locale = "C";
        tooltip-format = ''
          <big>{:%Y %B}</big>
          <tt><small><span font='JetbrainsMono Nerd Font'>{calendar}</span></small></tt>'';
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          weeks-pos = "right";
          format = {
            months = "<span color='${palette.rosewater}'><b>{}</b></span>";
            days = "<span color='${palette.pink}'><b>{}</b></span>";
            weeks = "<span color='${palette.teal}'><b>W{}</b></span>";
            weekdays = "<span color='${palette.yellow}'><b>{}</b></span>";
            today = "<span color='${palette.red}'><b><u>{}</u></b></span>";
          };
        };
        actions = { on-click-right = "mode"; };
        interval = 1;
        timezone = "Asia/Taipei";
      };
      "custom/lyric" = {
        exec = "playerctl metadata --format='{{ title }}' --follow";
        format = "󰎆  {}";
        tooltip-format = "Play/Pause";
        on-click = "playerctl play-pause";
        escape = true;
        return-type = "text";
        max-length = 25;
      };

      # Monitor
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
        on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      };

      # Connection
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
          "{device_alias}\t{device_battery_percentage}%";
      };

      # Menu
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
        on-click = "swaync-client -t";
      };
      "custom/hexecute" = {
        format = " ";
        tooltip-format = "魔法使い";
        on-click = "hexecute";
      };
    }];

    style = ''
      @define-color rosewater ${palette.rosewater};
      @define-color flamingo ${palette.flamingo};
      @define-color pink ${palette.pink};
      @define-color mauve ${palette.mauve};
      @define-color red ${palette.red};
      @define-color maroon ${palette.maroon};
      @define-color peach ${palette.peach};
      @define-color yellow ${palette.yellow};
      @define-color green ${palette.green};
      @define-color teal ${palette.teal};
      @define-color sky ${palette.sky};
      @define-color sapphire ${palette.sapphire};
      @define-color blue ${palette.blue};
      @define-color lavender ${palette.lavender};
      @define-color accent ${palette.accent};
      @define-color text ${palette.text};
      @define-color subtext1 ${palette.subtext1};
      @define-color subtext0 ${palette.subtext0};
      @define-color overlay2 ${palette.overlay2};
      @define-color overlay1 ${palette.overlay1};
      @define-color overlay0 ${palette.overlay0};
      @define-color surface2 ${palette.surface2};
      @define-color surface1 ${palette.surface1};
      @define-color surface0 ${palette.surface0};
      @define-color surface0-alpha alpha(@surface0, 0.8);
      @define-color base-alpha alpha(@base, 0.6);
      @define-color border-alpha alpha(@accent, 0.7);
      @define-color base ${palette.base};
      @define-color mantle ${palette.mantle};
      @define-color crust ${palette.crust};

      * {
        font-family: ${config.style.font.default}, "Noto Sans CJK JP", "Noto Sans CJK TC", "Noto Sans CJK SC";
        font-size: 17px;
        min-height: 0;
      }

      #waybar {
        background: transparent;
        color: @text;
      }

      #hyprland,
      #cava,
      #misc,
      #monitor,
      #connection,
      #menu {
        border: 2px solid;
        border-color: @lavender;
        border-radius: 1rem;
        background-color: @surface0-alpha;
        padding: 0.5rem 0.7rem;
        margin: 0rem;
      }

      #hyprland {
        border-color: @sky;
        padding: 0.5rem 0rem 0.5rem 0.5rem;
      }

      #workspaces,
      #window {
        padding: 0rem 0rem;
      }

      #workspaces button {
        background: @surface1;
        color: @lavender;
        border-radius: 1rem;
        padding: 0rem 0.3rem;
        margin: 0rem 0.3rem;
      }

      #workspaces button.active {
        background: @sky;
        color: @surface1;
      }

      #workspaces button:hover {
        background: @sky;
        color: @surface1;
      }

      #window {
        margin: 0rem 0.4rem 0rem 0.1rem;
      }

      #cava {
        border-color: @pink;
        color: @pink;
        margin: 0rem 0rem 0rem 0.3rem;
      }

      #misc {
        border-color: @blue;
      }

      #clock,
      #custom-lyric {
        margin: 0rem 0rem 0rem 0.7rem;
      }

      #clock {
        color: @blue;
        margin: 0rem;
      }

      #custom-lyric {
        color: @text;
      }

      #monitor,
      #connection {
        padding: 0.5rem 0.7rem;
        margin: 0rem 0.3rem 0rem 0rem;
      }

      #monitor {
        border-color: @yellow;
      }

      #cpu,
      #memory,
      #backlight,
      #pulseaudio {
        margin: 0rem 0.7rem 0rem 0rem;
      }

      #cpu {
        color: @peach;
      }

      #memory {
        color: @teal;
      }

      #backlight {
        color: @yellow;
      }

      #pulseaudio {
        color: @maroon;
        margin: 0rem;
      }

      #connection {
        border-color: @lavender;
      }

      #network,
      #bluetooth {
        margin: 0rem 0.7rem 0rem 0rem;
      }

      #network {
        color: @lavender;
      }

      #bluetooth {
        margin: 0rem;
        color: @mauve;
      }

      #menu {
        border-color: @green;
      }

      #tray,
      #custom-hexecute {
        margin: 0rem 1rem 0rem 0rem;
      }

      #custom-hexecute {
        color: @green;
      }

      #battery {
        color: @green;
      }

      #battery.charging {
        color: @green;
      }

      #battery.warning:not(.charging) {
        color: @red;
      }
    '';
  };
}
