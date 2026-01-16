{
  laptop = {
    profile = import ./laptop/profile.nix { };
    module = ./laptop;
  };
}
