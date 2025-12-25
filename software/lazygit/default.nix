{ lib, config, ... }:

let
  name = "lazygit";
  cfg = config.software.${name};
  inner = import ./inner.nix;
in
{
  options.software.${name}.enable =
    lib.mkEnableOption "${name}";

  config = lib.mkIf cfg.enable inner;
}
