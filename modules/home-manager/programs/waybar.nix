{ config, ... }:

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
        margin-bottom = -5;

        # Definitions
        modules-left = [
          "group/hyprland"
          "cava"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "group/monitor"
          "tray"
          "battery"
        ];

        # Module settings
        "group/hyprland" = {
          orientation = "horizontal";
          modules = [
            "hyprland/workspaces"
            "hyprland/window"
          ];
        };
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
          icon-size = 15;
        };
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
        clock = {
          format = "󰥔  {:%H:%M}";
          format-alt = "󰃭  {:%Y-%m-%d %A}";
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
        "group/monitor" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
            "backlight"
            "pulseaudio"
          ];
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
          format = "{icon}  {percent}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };
        pulseaudio = {
          format = "{icon}  {volume}";
          format-bluetooth = "  {volume}";
          format-muted = "";
          format-icons = {
            default = [ "" "" "" ];
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
          format = "{icon}  {capacity}";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁾" "󰁿" "󰂀" "󰂁" "󰂁" "󰂂" "󰁹" ];
        };
      }
    ];

    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;

      * {
        font-family: ${config.userTheme.fontFamily};
        font-size: 17px;
        min-height: 0;
      }

      #waybar {
        background: transparent;
        color: @text;
      }

      #hyprland,
      #cava,
      #clock,
      #monitor,
      #tray,
      #battery {
        border-color: @lavender;
        border-radius: 1rem;
        background-color: @surface0;
        padding: 0.5rem 0.7rem;
        margin: 0rem 0rem;
      }

      #hyprland {
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
        color: @sky;
      }

      #workspaces button:hover {
        color: @sapphire;
      }

      #window {
        margin: 0rem 0.4rem 0rem 0.1rem;
      }

      #cava {
        color: @pink;
        margin: 0rem 0rem 0rem 0.3rem;
      }

      #clock {
        color: @blue;
      }

      #monitor {
        padding: 0.5rem 0.7rem;
        margin: 0rem 0.3rem 0rem 0rem;
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

      #tray {
        margin: 0rem 0.3rem 0rem 0rem;
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

