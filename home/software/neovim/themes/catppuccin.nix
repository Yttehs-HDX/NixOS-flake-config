{ config, lib, ... }:

let
  theme = config.profile.style.theme or { };
  themeName = theme.name or "";
  flavor = theme.flavor or "mocha";
in {
  config = lib.mkIf (themeName == "catppuccin") {
    programs.nixvim.colorschemes.catppuccin = {
      enable = true;
      settings = {
        disable_underline = true;
        flavour = flavor;
        integrations = {
          cmp = true;
          gitsigns = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          notify = false;
          nvimtree = true;
          treesitter = true;
        };
        styles = {
          booleans = [ "bold" "italic" ];
          conditionals = [ "bold" ];
        };
        term_colors = true;
      };
    };
  };
}
