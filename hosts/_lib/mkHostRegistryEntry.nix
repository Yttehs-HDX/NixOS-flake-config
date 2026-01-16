{ hostname }:

let
  baseDir = ../.;
  hostDir = baseDir + "/${hostname}";
  profile = import (hostDir + "/profile.nix") { };
in {
  name = profile.host.hostname;
  value = {
    inherit profile;
    module = hostDir;
  };
}
