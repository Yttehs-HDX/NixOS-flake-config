{ pkgs, ... }:

let
  terminal = "kitty";
  launcher = "rofi -show drun";
  ocrScript = pkgs.writeShellScript "ocr.sh" ''
    set -e
    img=$(mktemp /tmp/ocr_XXXXXX.png)
    txt=$(mktemp /tmp/ocr_XXXXXX)
    trap 'rm -f "$img" "''${txt}" "''${txt}.txt"' EXIT
    # Screenshot
    ${pkgs.grimblast}/bin/grimblast --freeze save area "$img" >/dev/null 2>&1
    # OCR
    ${pkgs.tesseract}/bin/tesseract "$img" "$txt" -l chi_sim+eng+jpn --psm 6
    raw=$(cat "''${txt}.txt")
    # Trim
    cleaned=$(printf "%s" "$raw" \
        | tr -d '\r' \
        | sed ':a;N;$!ba;s/\n/ /g' \
        | sed 's/[[:space:]]\+/ /g' \
        | sed 's/^[ \t]*//;s/[ \t]*$//' \
    )
    echo -n "$cleaned" | ${pkgs.wl-clipboard}/bin/wl-copy
  '';
in {
  imports = [
    ../aux/home.nix
    ./variables.nix
    ./exec-once.nix
    (import ./bindings.nix { inherit terminal launcher ocrScript; })
    ./xwayland.nix
    ./general.nix
    ./decoration.nix
    ./animations.nix
    ./layerrule.nix
    ./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
