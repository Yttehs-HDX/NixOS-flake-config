{ lib, config, ... }:

let
  cfg = config.software.git;
in
{
  options.software.git.enable =
    lib.mkEnableOption "git";

  imports = [ ./inner.nix ];
}
