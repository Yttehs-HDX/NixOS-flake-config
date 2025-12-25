{ lib, config, ... }:

let
  name = "git";
  cfg = config.software.${name};
in
{
  options.software.${name}.enable =
    lib.mkEnableOption "${name}";

  imports = [
    ./inner.nix
  ];
}
