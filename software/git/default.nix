{ lib, config, ... }:

let
  cfg = config.software.git;
in
{
  options.software.git.enable =
    lib.mkEnableOption "git";

  config = lib.mkIf cfg.enable {
    imports = [ ./inner.nix ];
  };
}
