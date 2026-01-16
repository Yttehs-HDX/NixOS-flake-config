{ ... }:

{
  systems = {
    laptop = "x86_64-linux";
  };

  defaultHost = "laptop";

  profiles = {
    laptop = import ./laptop/profile.nix { };
  };

  modules = {
    laptop = ./laptop;
  };
}
