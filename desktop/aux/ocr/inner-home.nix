{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "ocr";
  };

  ocr = pkgs.writeShellApplication {
    name = "ocr";
    runtimeInputs = [
      pkgs.coreutils
      pkgs.gnused
      pkgs.grimblast
      pkgs.tesseract
      pkgs.wl-clipboard
    ];
    text = ''
      set -e
      img=$(mktemp /tmp/ocr_XXXXXX.png)
      txt=$(mktemp /tmp/ocr_XXXXXX)
      trap 'rm -f "$img" "''${txt}" "''${txt}.txt"' EXIT
      # Screenshot
      grimblast --freeze save area "$img" >/dev/null 2>&1
      # OCR
      tesseract "$img" "$txt" -l chi_sim+eng+jpn --psm 6
      raw=$(cat "''${txt}.txt")
      # Trim
      cleaned=$(printf "%s" "$raw" \
          | tr -d '\r' \
          | sed ':a;N;$!ba;s/\n/ /g' \
          | sed 's/[[:space:]]\+/ /g' \
          | sed 's/^[ \t]*//;s/[ \t]*$//' \
      )
      echo -n "$cleaned" | wl-copy
    '';
  };
in mkAux { home.packages = [ ocr ]; }
