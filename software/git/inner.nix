{ ... }:

{
  programs.git = {
    enable = true;
    settings = { alias = { lazy = "!lazygit"; }; };
  };
}
