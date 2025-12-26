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

  software = {
    home-manager.enable = true;
    zsh.enable = true;
    kitty.enable = true;

    yazi.enable = true;
    eza.enable = true;
    fzf.enable = true;
    direnv.enable = true;
    command-not-found.enable = true;
    tmux.enable = true;
    git.enable = true;
    lazygit.enable = true;
    gh.enable = true;
    vscode.enable = true;
    translate-shell.enable = true;
    cava.enable = true;
    btop.enable = true;
    htop.enable = true;
    onlyoffice.enable = true;
    obs-studio.enable = true;
    nixvim.enable = true;
    file.enable = true;

    bat.enable = true;

    zip.enable = true;
    unzip.enable = true;
    unrar.enable = true;
    duf.enable = true;
    dig.enable = true;
    jq.enable = true;
    fastfetch.enable = true;
    tldr.enable = true;
    tgpt.enable = true;
    scrcpy.enable = true;
    hexecute.enable = true;
    krita.enable = true;
    mikusays.enable = true;
    figlet.enable = true;
    lolcat.enable = true;
    tesseract.enable = true;
    poppler-utils.enable = true;
    cryptsetup.enable = true;

    nmap.enable = true;
    wget.enable = true;
    android-tools.enable = true;
    universal-android-debloater.enable = true;
    nixfmt-classic.enable = true;
    huggingface-hub.enable = true;

    feishu.enable = true;

    asciiquarium.enable = true;
    hmcl.enable = true;
    cmatrix.enable = true;
    cbonsai.enable = true;
    pipes-rs.enable = true;

    google-chrome.enable = true;
    qq.enable = true;
    wechat.enable = true;
    osu-lazer-bin.enable = true;
    jetbrains-toolbox.enable = true;
  };

  home = {
    username = "shetty";
    homeDirectory = "/home/shetty";

    packages = with pkgs; [
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
    };
  };

  home.stateVersion = "25.11";
}
