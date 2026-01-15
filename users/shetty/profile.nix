{ ... }:

{
  style = {
    theme = "catppuccin";
    accent = "lavender";
    flavor = "mocha";
    font = {
      default = "SF Pro";
      mono = "JetBrainsMono Nerd Font";
    };
  };

  desktop = {
    enable = true;
    sessions.hyprland.enable = true;

    dm.sddm.enable = true;

    aux = {
      nerd-fonts-jetbrains-mono.enable = true;
      noto-fonts.enable = true;
      noto-fonts-cjk-sans.enable = true;
      noto-fonts-cjk-serif.enable = true;
      noto-fonts-emoji-blob-bin.enable = true;
    };
  };

  home.software = {
    home-manager.enable = true;
    zsh.enable = true;
    kitty.enable = true;
    kdeconnect.enable = true;

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
    clash-verge-rev.enable = true;
    qq.enable = true;
    wechat.enable = true;
    osu-lazer-bin.enable = true;
    jetbrains-toolbox.enable = true;
  };
}
