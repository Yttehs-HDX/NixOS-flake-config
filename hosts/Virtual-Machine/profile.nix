{ ... }:

{
  host = {
    hostname = "VM-Machine";
    users = [ "test-user" ];
    system = "x86_64-linux";
  };

  system.software = { grub.enable = true; };
}
