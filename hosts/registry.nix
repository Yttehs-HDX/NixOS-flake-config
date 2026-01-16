{
  laptop = {
    profile = import ./laptop/profile.nix { };
    module = ./laptop;
  };
  server = {
    profile = import ./server/profile.nix { };
    module = ./server;
  };
}
