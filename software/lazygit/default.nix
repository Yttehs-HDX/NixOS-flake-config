{ lib, config, ... }:

let
  name = "lazygit";
  cfg = config.software.${name};
in
{
  options.software.${name}.enable =
    lib.mkEnableOption "${name}";

  imports = [
    ./inner.nix
  ];
}
