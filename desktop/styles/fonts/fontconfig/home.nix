{ config, ... }:

let
  fontDefault = config.style.font.default;
  fontMono = config.style.font.mono;
in {
  config = {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          fontMono
          "Noto Sans Mono CJK JP"
          "Noto Sans Mono CJK TC"
          "Noto Sans Mono CJK SC"
        ];
        sansSerif = [
          fontDefault
          "Noto Sans CJK JP"
          "Noto Sans CJK TC"
          "Noto Sans CJK SC"
        ];
        serif = [
          fontDefault
          "Noto Serif CJK JP"
          "Noto Serif CJK TC"
          "Noto Serif CJK SC"
        ];
        emoji = [ "Noto Emoji Blob" ];
      };
    };
  };
}
