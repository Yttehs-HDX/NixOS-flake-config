{ ... }:

let
  terminal = "kitty";
  launcher = "rofi -show drun";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      exec-once = [
        "wl-paste --watch cliphist store"
      ];

      "$mod" = "SUPER";
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ];
      bind = [
        # Basic
        "$mod, Q, exec, ${terminal}"
        "$mod, R, exec, ${launcher}"
        "$mod, F, fullscreen"
        "$mod, C, killactive"
        "$mod, V, exec, hyprctl dispatch togglefloating"

        # Logout
        "$mod, M, exec, hyprctl dispatch exit"

        # Screen lock
        "$mod, L, exec, swaylock --screenshots --clock --text-color=b7bdf8 --text-caps-lock-color=f5bde6 --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 25x25 --effect-vignette 0.5:0.5 --ring-color b7bdf8 --key-hl-color f5bde6 --line-color 00000000 --inside-color 00000088 --separator-color 00000000"

        # Clipboard manager
        "$mod, W, exec, cliphist list | rofi -dmenu -p '  clipboard' -no-show-icons -display-columns 1,2 | cliphist decode | wl-copy"

        # Emoji chooser
        "$mod, E, exec, rofimoji --action copy --prompt '󰞅  emoji' --use-icons"

        # Screenshot
        ", Print, exec, grimblast --freeze save area - | swappy -f -"
        "$mod, DELETE, exec, grimblast --freeze save area - | swappy -f -"

        # Color picker
        "$mod ALT, DELETE, exec, hyprpicker --autocopy --format=hex"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        ", xf86KbdBrightnessUp, exec, brightnessctl -d *::kbd_backlight set 33%+"
        ", xf86KbdBrightnessDown, exec, brightnessctl -d *::kbd_backlight set 33%-"
      ] ++ (
        builtins.concatLists (
          builtins.genList (i:
            let
              key = i + 1;
              ws = key;
            in [
              "$mod, ${toString key}, workspace, ${toString ws}"
              "$mod SHIFT, ${toString key}, movetoworkspace, ${toString ws}"
            ]
          ) 8
        )
      );

      general = {
        gaps_in = 4;
        gaps_out = 9;
        border_size = 2;
        "col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
        "col.inactive_border" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
        resize_on_border = true;
        layout = "dwindle";
      };

      decoration = {
        shadow.enabled = false;
        rounding = 10;
        dim_special = 0.3;
        blur = {
          enabled = true;
          special = true;
          size = 6;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "fluent_decel, 0.1, 1, 0, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 2.5, md3_decel"
          "workspaces, 1, 3.5, easeOutExpo, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      layerrule = [
        "blur,rofi"
        "ignorezero,rofi"
        "ignorealpha 0.7, rofi"
      ];
    };
  };
}

