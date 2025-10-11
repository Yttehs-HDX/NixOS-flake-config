{ config, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ config.userTheme.fontFamily ];
      sansSerif = [ config.userTheme.fontFamily ];
      serif = [ config.userTheme.fontFamily ];
      emoji = [ config.userTheme.fontFamily ];
    };
  };
}

