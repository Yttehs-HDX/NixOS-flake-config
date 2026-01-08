{ pkgs, ... }:

{
  services.displayManager.sddm = let
    flavor = "mocha";
    accent = "lavender";
  in {
    enable = true;
    wayland.enable = true;
    theme = "${
        pkgs.catppuccin-sddm.override { inherit flavor accent; }
      }/share/sddm/themes/catppuccin-${flavor}-${accent}";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
    ];
  };

  environment.systemPackages = with pkgs; [
    # Ensure the SDDM theme is available system-wide.
    (catppuccin-sddm.override { flavor = "mocha"; })
  ];
}
