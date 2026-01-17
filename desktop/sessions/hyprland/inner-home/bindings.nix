{ pkgs, ... }:

let
  terminalCmd = "kitty";
  launcherCmd = "rofi -show drun";
  ocrCmd = "ocr";
  lockCmd = "swaylock-themed";
  clipboardCmd =
    "cliphist list | rofi -dmenu -p '  clipboard' -no-show-icons -display-columns 1,2 | cliphist decode | wl-copy";
  emojiCmd = "rofimoji --action copy --prompt '󰞅  emoji' --use-icons";
  screenshotCmd = "grimblast --freeze save area - | swappy -f -";
  colorPickerCmd = "hyprpicker --autocopy --format=hex";
in {
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
      "$mod, Q, exec, ${terminalCmd}"
      "$mod, R, exec, ${launcherCmd}"
      "$mod, F, fullscreen"
      "$mod, C, killactive"
      "$mod, V, exec, hyprctl dispatch togglefloating"
      "$mod, TAB, hyprexpo:expo, toggle"
      "$mod, escape, exec, hexecute"

      # Advanced
      "$mod, M, exec, hyprctl dispatch exit"
      "$mod, W, exec, ${clipboardCmd}"
      "$mod, E, exec, ${emojiCmd}"
      ", Print, exec, ${screenshotCmd}"
      "$mod SHIFT, S, exec, ${screenshotCmd}"
      "$mod SHIFT, T, exec, ${ocrCmd}"
      "$mod ALT, L, exec, ${lockCmd}"
      "$mod ALT, DELETE, exec, ${colorPickerCmd}"

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
