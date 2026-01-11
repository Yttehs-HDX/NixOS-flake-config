{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    bat

    # Boot manager
    refind

    # Driver
    asusctl
  ];

  environment.variables = {
    EDITOR = "nvim";
    PAGER = "bat";
  };
}
