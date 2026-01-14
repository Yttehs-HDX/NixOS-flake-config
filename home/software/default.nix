{ lib, ... }:

let
  softwareSubmodule = lib.types.submodule ({ ... }: {
    options.enable = lib.mkEnableOption "Enable a software package.";
  });
in
{
  options.software = lib.mkOption {
    type = lib.types.attrsOf softwareSubmodule;
    default = {};
    description = "Per-package software toggles for Home Manager.";
  };

  imports = [
    ./android-tools
    ./asciiquarium
    ./bat
    ./btop
    ./cava
    ./cbonsai
    ./cmatrix
    ./command-not-found
    ./cryptsetup
    ./dig
    ./direnv
    ./duf
    ./eza
    ./fastfetch
    ./feishu
    ./figlet
    ./file
    ./fzf
    ./gh
    ./git
    ./google-chrome
    ./hexecute
    ./home-manager
    ./htop
    ./huggingface-hub
    ./hmcl
    ./jq
    ./jetbrains-toolbox
    ./kitty
    ./kdeconnect
    ./krita
    ./lazygit
    ./lolcat
    ./mikusays
    ./nixfmt-classic
    ./nixvim
    ./nmap
    ./obs-studio
    ./onlyoffice
    ./osu-lazer-bin
    ./pipes-rs
    ./poppler-utils
    ./qq
    ./scrcpy
    ./tgpt
    ./tesseract
    ./tldr
    ./translate-shell
    ./tmux
    ./universal-android-debloater
    ./unrar
    ./unzip
    ./vscode
    ./wechat
    ./wget
    ./yazi
    ./zip
    ./zsh
    ./xdg
  ];
}
