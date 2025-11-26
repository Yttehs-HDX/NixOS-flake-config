{ pkgs, nur, hexecute, nixvim, ... }:

{
  imports = [ nixvim.homeModules.nixvim ];

  nixpkgs.config.allowUnfree = true;

  userTheme = {
    catppuccinVariant = "mocha";
    catppuccinAccent = "lavender";
    fontFamily = "SF Pro";
    fontSize = 12;
    cursorSize = 24;
  };

  home = {
    username = "shetty";
    homeDirectory = "/home/shetty";

    packages = with pkgs; [
      # Basic
      bat
      yazi

      # Desktop
      playerctl
      brightnessctl
      pulseaudio
      swaylock-effects
      libnotify
      wl-clipboard
      grimblast
      swappy
      hyprpicker
      rofimoji
      vlc
      seahorse

      # Fonts
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji-blob-bin

      # Tools
      zip
      unzip
      unrar
      duf
      dig
      file
      jq
      fastfetch
      tldr
      tgpt
      scrcpy
      hexecute.packages.${pkgs.system}.default
      krita
      nur.zerozawa.mikusays
      figlet
      lolcat
      tesseract
      poppler_utils

      # Dev
      nmap
      wget
      android-tools
      universal-android-debloater
      nixfmt-classic

      # Media
      feishu

      # Games
      asciiquarium
      hmcl
      cmatrix
      cbonsai
      pipes-rs

      # Unfree
      google-chrome
      qq
      wechat
      osu-lazer-bin
      jetbrains-toolbox
    ];

    sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      GDK_BACKEND = "wayland,x11,*";
      GDK_SCALE = 1;
      GDK_DPI_SCALE = 1;
      NIXOS_OZONE_WL = 1;
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      MOZ_ENABLE_WAYLAND = 1;
      OZONE_PLATFORM = "wayland";
      EGL_PLATFORM = "wayland";
      CLUTTER_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;

      EDITOR = "nvim";
      PAGER = "bat";
    };
  };

  home.stateVersion = "25.05";
}

