{ lib, profile, ... }:

let
  mkFont = import ../_lib/mkFont.nix;
in
mkFont {
  inherit lib profile;
  name = "nerd-fonts-jetbrains-mono";
  inner = ./inner-home.nix;
}
