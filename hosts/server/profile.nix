{ ... }:

{
  host = {
    name = "Test-Server";
    users = [ "shetty" "testuser" ];  # Multiple users on this host
    system = "x86_64-linux";
  };

  system = {
    software = {
      networking.enable = true;
      firewall.enable = true;
      grub.enable = true;
      locale.enable = true;
      nix-ld.enable = true;
    };
  };
}
