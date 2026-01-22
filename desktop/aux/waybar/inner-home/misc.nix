{ config, ... }:

let
  palette = config.profile.style.theme.palette;
  playerTitleCmd = "playerctl metadata --format='{{ title }}' --follow";
  playPauseCmd = "playerctl play-pause";
in {
  programs.waybar.settings.main = {
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
      exec = playerTitleCmd;
      format = "󰎆  {}";
      tooltip-format = "Play/Pause";
      on-click = playPauseCmd;
      escape = true;
      return-type = "text";
      max-length = 25;
    };
  };
}
