{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    extraPackages = with pkgs; [
      gcc
      clang
      gnumake
      pkg-config
    ];

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        disable_underline = true;
        flavour = "mocha";
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

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      web-devicons.enable = true;
      treesitter = {
        enable = true;
        settings = {
          auto_install = true;
          highlight.enable = true;
          incremental_selection.enable = true;
          indent.enable = true;
        };
      };
      noice.enable = true;
      nvim-tree = {
        enable = true;
        openOnSetup = true;
      };
      cmp.enable = true;
      copilot-chat.enable = true;
      copilot-cmp.enable = true;
      render-markdown.enable = true;
      markdown-preview.enable = true;
    };
  };
}

