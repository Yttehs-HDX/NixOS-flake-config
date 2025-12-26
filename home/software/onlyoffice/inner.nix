{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.onlyoffice;
in
mkWhenEnabled cfg.enable {
  programs.onlyoffice = {
    enable = true;
    settings = {
      UITheme = "theme-night";
      editorWindowMode = false;
      locale = "zh-CN";
    };
  };
}
