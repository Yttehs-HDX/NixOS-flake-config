{ lib, config, ... }:

let
  mkWhenEnabled = import ../_lib/mkWhenEnabled.nix { inherit lib; };
  cfg = config.software.vscode;
in
mkWhenEnabled cfg.enable {
  programs.vscode.enable = true;
}
