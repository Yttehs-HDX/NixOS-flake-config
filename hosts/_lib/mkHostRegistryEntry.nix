{ name }:

let
  baseDir = ../.;
  hostDir = baseDir + "/${name}";
  profile = import (hostDir + "/profile.nix") { };
in {
  name = profile.host.hostname;
  value = {
    inherit profile;
    module = hostDir;
  };
}
