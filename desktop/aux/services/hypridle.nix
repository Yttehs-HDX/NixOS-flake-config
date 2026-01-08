{ ... }:

let
  lockCmd =
    "swaylock --screenshots --clock --text-color=b7bdf8 --text-caps-lock-color=f5bde6 --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 25x25 --effect-vignette 0.5:0.5 --ring-color b7bdf8 --key-hl-color f5bde6 --line-color 00000000 --inside-color 00000088 --separator-color 00000000";
  displayOnCmd = "hyprctl dispatch dpms on";
  displayOffCmd = "hyprctl dispatch dpms off";
in {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = displayOnCmd;
        ignore_dbus_inhibit = false;
        lock_cmd = lockCmd;
      };

      listener = [
        {
          timeout = 600; # 10 minutes
          on-timeout = lockCmd;
        }
        {
          timeout = 900; # 15 minutes
          on-timeout = displayOffCmd;
          on-resume = displayOnCmd;
        }
      ];
    };
  };
}

