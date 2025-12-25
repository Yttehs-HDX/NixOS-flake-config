{ lib, config, ... }:

let
  cfg = config.software.git;
in
{
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = { alias = { lazy = "!lazygit"; }; };
    };
  };
}
