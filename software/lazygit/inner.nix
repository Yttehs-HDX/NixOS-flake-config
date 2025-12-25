{ lib, config, ... }:

let
  cfg = config.software.lazygit;
in
{
  config = lib.mkIf cfg.enable {
    programs.lazygit.enable = true;
  };
}
