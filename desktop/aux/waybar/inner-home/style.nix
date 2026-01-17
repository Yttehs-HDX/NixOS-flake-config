{ config, ... }:

let palette = config.desktop.style.theme.palette;
in {
  programs.waybar.style = ''
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
      font-family: ${config.desktop.style.fonts.default}, "Noto Sans CJK JP", "Noto Sans CJK TC", "Noto Sans CJK SC";
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
}
