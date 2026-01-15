{ config, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ config.desktop.style.fonts.mono.default ];
      sansSerif = [ config.desktop.style.fonts.default ];
      serif = [ config.desktop.style.fonts.default ];
    };
  };
}
