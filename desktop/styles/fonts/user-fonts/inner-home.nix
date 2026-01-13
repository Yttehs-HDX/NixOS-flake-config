{ config, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ config.style.font.mono ];
      sansSerif = [ config.style.font.default ];
      serif = [ config.style.font.default ];
    };
  };
}
