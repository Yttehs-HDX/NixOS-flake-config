{ ... }:

let
  lockCmd = "swaylock-themed";
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
