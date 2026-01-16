{ name }:

let
  baseDir = ../.;
  userDir = baseDir + "/${name}";
  profile = import (userDir + "/profile.nix") { };
in {
  name = profile.user.username;
  value = {
    inherit profile;
    module = userDir;
  };
}
