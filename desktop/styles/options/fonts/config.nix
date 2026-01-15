{ lib, profile, ... }:

let
  styleProfile = (profile.desktop or {}).style or {};
  fontProfile = styleProfile.fonts or {};
  monoProfile = fontProfile.mono or {};
in {
  imports = [
    ./default-value.nix
  ];

  config = lib.mkMerge [
    (lib.mkIf (fontProfile ? default) {
      desktop.style.fonts.default = lib.mkDefault fontProfile.default;
    })
    (lib.mkIf (monoProfile ? default) {
      desktop.style.fonts.mono.default = lib.mkDefault monoProfile.default;
    })
  ];
}
