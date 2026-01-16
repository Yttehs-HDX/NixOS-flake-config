{ ... }:

let
  registry = import ./registry.nix { };
  profiles = builtins.mapAttrs (_: v: v.profile) registry;
  modules = builtins.mapAttrs (_: v: v.module) registry;
  defaultUsers = builtins.attrNames profiles;
in { inherit defaultUsers profiles modules; }
