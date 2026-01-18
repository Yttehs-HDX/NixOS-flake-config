{ path }:

let
  name = builtins.baseNameOf path;
  profile = import (path + "/profile.nix") { };
in { inherit name profile; }
