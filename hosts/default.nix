{ lib, nur, home-manager, hexecute, nixvim, users, homeModules }:

let
  registry = import ./registry.nix { };
  mkHost = import ./_lib/mkHost.nix {
    inherit lib nur home-manager hexecute nixvim users homeModules;
  };
  hostProfiles = builtins.mapAttrs (_: v: v.profile) registry;
  hostModules = builtins.mapAttrs (_: v: v.module) registry;
  systems = builtins.mapAttrs (_: v: v.profile.host.system) registry;
  hostEntries = builtins.mapAttrs (name: v: {
    hostKey = name;
    system = v.profile.host.system;
    profile = v.profile;
    module = v.module;
  }) registry;
in {
  inherit systems;
  profiles = hostProfiles;
  modules = hostModules;
  nixosConfigurations = lib.mapAttrs (_: v: mkHost {
    hostKey = v.hostKey;
    system = v.system;
    hostProfile = v.profile;
    hostModule = v.module;
  }) hostEntries;
}
