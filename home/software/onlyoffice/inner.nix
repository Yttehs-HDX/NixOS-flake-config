{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "onlyoffice";
  };
in mkSoftware {

  programs.onlyoffice = {
    enable = true;
    settings = {
      UITheme = "theme-night";
      editorWindowMode = false;
      locale = "zh-CN";
    };
  };
}
