{ profile, ... }:

let
  style = profile.style or {};
  font = style.font or "DejaVu Sans";
in {
  config = {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Sans Mono CJK JP"
          "Noto Sans Mono CJK TC"
          "Noto Sans Mono CJK SC"
        ];
        sansSerif = [
          font
          "Noto Sans CJK JP"
          "Noto Sans CJK TC"
          "Noto Sans CJK SC"
        ];
        serif = [
          font
          "Noto Serif CJK JP"
          "Noto Serif CJK TC"
          "Noto Serif CJK SC"
        ];
        emoji = [ "Noto Emoji Blob" ];
      };
    };
  };
}
