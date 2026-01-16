{ config, lib, ... }:

let
  mkCatppuccinTheme =
    import ../../../../desktop/styles/themes/catppuccin/_lib/mkCatppuccinTheme.nix {
      inherit lib config;
    };
in {
  config = mkCatppuccinTheme ({ flavor, ... }: {
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
  });
}
