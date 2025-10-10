{ config, pkgs, ... }:

let
  username = "shetty";
  globalFontFamily = "SF Pro";
  globalFontSize = 12;
  cursorSize = 24;

  catppuccinVariant = "mocha";
  catppuccinAccent = "lavender";
  catppuccinKvantum = pkgs.catppuccin-kvantum.override {
    variant = catppuccinVariant;
    accent = catppuccinAccent;
  };
  catppuccin = "catppuccin-${catppuccinVariant}-${catppuccinAccent}";
in {
  nixpkgs.config.allowUnfree = true;

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs;[
      # Basic
      neovim
      bat
      yazi

      # Desktop
      wofi
      playerctl
      brightnessctl

      # Fonts
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji-blob-bin

      # Tools
      duf
      dig
      fastfetch
      tldr

      # Unfree
      google-chrome
    ];

    sessionVariables = {
      # Hyprland
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

      # Custom
      EDITOR = "nvim";
      PAGER = "bat";
    };
  };

  services = {
    # gnome-keyring.enable = true;
    hyprpolkitagent.enable = true;
  };

  programs = {
    home-manager.enable = true;

    kitty = {
      enable = true;
      enableGitIntegration = true;

      font = {
        name = "JetbrainsMono Nerd Font";
        size = 14.0;
      };
      themeFile = "Catppuccin-Mocha";

      shellIntegration = {
        mode = "no_cursor";
        enableZshIntegration = true;
      };

      settings = {
        background_opacity = 0.9;
        background_blur = 1;
        remember_window_size = false;
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      history.size = 100000;
      historySubstringSearch.enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        c = "clear";
        v = "nvim";
        whats = "gh copilot explain";
        howto = "gh copilot suggest";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "z"
          "tmux"
          "tldr"
          "history"
          "sudo"
          "command-not-found"
          "vscode"
        ];
      };

      zplug = {
        enable = true;
        plugins = [
          { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        ];
      };

      initContent = ''
        source ~/.p10k.zsh
      '';
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;

      icons = "always";
      git = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    command-not-found.enable = true;

    tmux.enable = true;

    git.enable = true;

    lazygit.enable = true;

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      extensions = [
        pkgs.gh-copilot
      ];
    };

    vscode.enable = true;
  };

  wayland.windowManager.hyprland = let
    terminal = "kitty";
    fileManager = "yazi";
  in {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$mod" = "SUPER";
      bindm = [
        # Mouse
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindl = [
        # Playerctl
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      bindel = [
        # Laptop media keys
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ];
      bind = [
        # Basic
        "$mod, Q, exec, ${terminal}"
        "$mod, E, exec, ${fileManager}"
        "$mod, R, exec, wofi --show drun"
        "$mod, V, exec, hyprctl dispatch togglefloating"
        "$mod, F, fullscreen"
        "$mod, C, killactive"
        "$mod, M, exec, hyprctl dispatch exit"

        # Window manager
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        # Mouse
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # Brightnessctl
        ", xf86KbdBrightnessUp, exec, brightnessctl -d *::kbd_backlight set 33%+"
        ", xf86KbdBrightnessDown, exec, brightnessctl -d *::kbd_backlight set 33%-"
      ]
      ++ (
        # Workspace
        builtins.concatLists (
          builtins.genList (i:
            let
              key = i + 1;
              ws = key;
            in [
              "$mod, ${toString key}, workspace, ${toString ws}"
              "$mod SHIFT, ${toString key}, movetoworkspace, ${toString ws}"
            ]
          ) 8
        )
      );
    };
  };

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-chinese-addons
        fcitx5-pinyin-zhwiki
        fcitx5-pinyin-moegirl
        fcitx5-mozc
        catppuccin-fcitx5
      ];
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ globalFontFamily ];
      sansSerif = [ globalFontFamily ];
      serif = [ globalFontFamily ];
      emoji = [ globalFontFamily ];
    };
  };

  gtk = {
    enable = true;
    gtk2.force = true;
    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = "1";
    };
    theme = {
      name = "${catppuccin}-compact";
      package = pkgs.catppuccin-gtk.override {
        variant = catppuccinVariant;
        accents = [ catppuccinAccent ];
        size = "compact";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Lavender";
      package = pkgs.catppuccin-cursors.mochaLavender;
      size = cursorSize;
    };
    font = {
      name = globalFontFamily;
      size = globalFontSize;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "kvantum";
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = cursorSize;
  };

  xdg.configFile = {
    "gtk-4.0/assets" = {
      force = true;
      source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    };
    "gtk-4.0/gtk.css" = {
      force = true;
      source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    };
    "gtk-4.0/gtk-dark.css" = {
      force = true;
      source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
    };
    "Kvantum/${catppuccin}".source = "${catppuccinKvantum}/share/Kvantum/${catppuccin}";
    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
      General.theme = catppuccin;
    };
  };

  home.stateVersion = "25.05";
}

