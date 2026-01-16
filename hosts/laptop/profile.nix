{ ... }:

{
  host = {
    name = "Shetty-Laptop";
    users = [ "shetty" ];
    system = "x86_64-linux";
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
