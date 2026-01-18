{ name }:

let
  baseDir = ../.;
  userDir = baseDir + "/${name}";
  profile = import (userDir + "/profile.nix") { };
  username = profile.user.username;
in {
  name = username;
  value = { inherit profile username; };
}
