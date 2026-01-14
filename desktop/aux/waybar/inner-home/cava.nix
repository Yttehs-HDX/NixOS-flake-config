{ ... }:

let
  playPauseCmd = "playerctl play-pause";
in {
  programs.waybar.settings.main = {
    cava = {
      hide_on_silence = true;
      framerate = 60;
      bars = 8;
      format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      input_delay = 1;
      sleep_timer = 5;
      bar_delimiter = 0;
      on-click = playPauseCmd;
    };
  };
}
