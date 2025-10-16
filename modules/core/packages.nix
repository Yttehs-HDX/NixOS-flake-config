{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    bat

    # Boot manager
    refind

    # Driver
    asusctl

    # Sddm theme
    (catppuccin-sddm.override {
      flavor = "mocha";
    })
  ];

  environment.variables = {
    EDITOR = "nvim";
    PAGER = "bat";
  };
}

