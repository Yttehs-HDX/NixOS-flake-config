{ lib, nixpkgs, nur, home-manager, hexecute, nixvim, homeModules }:

let
  registry = import ./registry.nix;
  profiles = builtins.mapAttrs (_: v: v.profile) registry;
  modules = builtins.mapAttrs (_: v: v.module) registry;
  defaultUsers = builtins.attrNames profiles;
  
  # Create home-only configurations for standalone home-manager usage
  mkHomeOnly = import ./_lib/mkHomeOnly.nix {
    inherit lib nixpkgs nur home-manager hexecute nixvim homeModules;
  };
  
  homeConfigurations = builtins.mapAttrs (name: _: mkHomeOnly {
    username = name;
    userProfile = profiles.${name};
    userModule = modules.${name};
  }) registry;
in {
  inherit defaultUsers profiles modules homeConfigurations;
}
