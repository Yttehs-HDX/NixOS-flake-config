{ config, lib, pkgs, ... }:

{
  services = {
    asusd.enable = true;
    tlp.enable = true;
  };
}
