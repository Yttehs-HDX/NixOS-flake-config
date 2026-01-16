{ username }:

let
  baseDir = ../.;
  userDir = baseDir + "/${username}";
  profile = import (userDir + "/profile.nix") { };
in {
  name = profile.user.username;
  value = {
    inherit profile;
    module = userDir;
  };
}
