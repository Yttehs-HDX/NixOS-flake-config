{
  shetty = {
    profile = import ./shetty/profile.nix { };
    module = ./shetty;
  };
  testuser = {
    profile = import ./testuser/profile.nix { };
    module = ./testuser;
  };
}
