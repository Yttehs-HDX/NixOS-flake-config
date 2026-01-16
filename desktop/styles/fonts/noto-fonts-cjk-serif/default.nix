{ lib, profile, ... }:

let mkFont = import ../_lib/mkFont.nix;
in mkFont {
  inherit lib profile;
  name = "noto-fonts-cjk-serif";
  inner = ./inner-home.nix;
}
