{ ... }:

{
  programs.git = {
    enable = true;
    aliases = { lazy = "!lazygit"; };
  };
}

