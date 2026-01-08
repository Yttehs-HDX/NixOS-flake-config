{ config, ... }:

{
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
}
