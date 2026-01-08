{ config, lib, profile, ... }:

let
  desktop = profile.desktop or {};
  styles = desktop.styles or {};
  fonts = styles.fonts or {};
  fontconfig = fonts.fontconfig or {};
  enabled = (desktop.enable or false) && (fontconfig.enable or false);
in {
  config = lib.mkIf enabled {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          config.userTheme.fontFamily
          "Noto Sans Mono CJK JP"
          "Noto Sans Mono CJK TC"
          "Noto Sans Mono CJK SC"
        ];
        sansSerif = [
          config.userTheme.fontFamily
          "Noto Sans CJK JP"
          "Noto Sans CJK TC"
          "Noto Sans CJK SC"
        ];
        serif = [
          config.userTheme.fontFamily
          "Noto Serif CJK JP"
          "Noto Serif CJK TC"
          "Noto Serif CJK SC"
        ];
        emoji = [ config.userTheme.fontFamily "Noto Emoji Blob" ];
      };
    };
  };
}
