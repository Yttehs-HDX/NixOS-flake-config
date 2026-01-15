{ lib, profile, ... }:

let
  mkFont = import ../_lib/mkFont.nix;
in
mkFont {
  inherit lib profile;
  name = "noto-fonts-cjk-sans";
  inner = ./inner-home.nix;
}
