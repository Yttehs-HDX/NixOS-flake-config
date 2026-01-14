{ terminal, launcher, ocrScript, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
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
      "$mod, SPACE, overview:toggle"
      "$mod, TAB, hyprexpo:expo, toggle"
      "$mod, escape, exec, hexecute"

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
      "$mod SHIFT, S, exec, grimblast --freeze save area - | swappy -f -"

      # OCR
      "$mod SHIFT, T, exec, ${ocrScript}"

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
    ] ++ (builtins.concatLists (builtins.genList (i:
      let
        key = i + 1;
        ws = key;
      in [
        "$mod, ${toString key}, workspace, ${toString ws}"
        "$mod SHIFT, ${toString key}, movetoworkspace, ${toString ws}"
      ]) 9) ++ (let
        key = 0;
        ws = 10;
      in [
        "$mod, ${toString key}, workspace, ${toString ws}"
        "$mod SHIFT, ${toString key}, movetoworkspace, ${toString ws}"
      ]));
  };
}
