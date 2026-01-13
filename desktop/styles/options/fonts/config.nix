{ lib, profile, ... }:

let
  styleProfile = profile.style or {};
  fontProfile = styleProfile.font or {};
in {
  imports = [
    ./default-value.nix
  ];

  config = lib.mkMerge [
    (lib.mkIf (fontProfile ? default) {
      style.font.default = lib.mkDefault fontProfile.default;
    })
    (lib.mkIf (fontProfile ? mono) {
      style.font.mono = lib.mkDefault fontProfile.mono;
    })
  ];
}
