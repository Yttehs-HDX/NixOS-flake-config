{ lib }:

{ name, inner }:

{
  options.software.${name}.enable =
    lib.mkEnableOption name;

  imports = [
    inner
  ];
}
