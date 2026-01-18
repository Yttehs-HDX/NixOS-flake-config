{ path }:

let
  name = builtins.baseNameOf path;
  profile = import (path + "/profile.nix") { };
  hardwareConfig = path + "/hardware-configuration.nix";
in { inherit name profile hardwareConfig; }
