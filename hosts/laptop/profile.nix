{ ... }:

{
  host = {
    name = "Shetty-Laptop";
  };

  system = {
    software = {
      bluetooth.enable = true;
      networking.enable = true;
      firewall.enable = true;
      grub.enable = true;
      locale.enable = true;
      nvidia.enable = true;
      refind.enable = true;
      asusctl.enable = true;
      tlp.enable = true;
      waydroid.enable = true;
      zram.enable = true;
      nix-ld.enable = true;
    };
  };
}
