{ config, lib, pkgs, ... }:

let
  userProfiles = config.profile.users or { };
  anyUserEnabled = lib.any (userProfile:
    let
      desktop = userProfile.desktop or { };
      aux = desktop.aux or { };
      item = aux.fcitx5 or { };
    in (desktop.enable or false) && (item.enable or false))
    (builtins.attrValues userProfiles);
in {
  imports = [ ./themes/catppuccin.nix ];

  config = lib.mkIf anyUserEnabled {
    i18n.inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          qt6Packages.fcitx5-chinese-addons
          fcitx5-pinyin-zhwiki
          fcitx5-pinyin-moegirl
          fcitx5-mozc
        ];
      };
    };
  };
}
