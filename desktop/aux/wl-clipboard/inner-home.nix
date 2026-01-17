{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "wl-clipboard";
  };
in mkAux {
  home.packages = [ pkgs.cliphist pkgs.wl-clipboard ];
  systemd.user.services.wl-clipboard-cliphist-watch = {
    Unit = {
      Description = "wl-clipboard cliphist watch";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart =
        "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
    };
    Install = { WantedBy = [ "graphical-session.target" ]; };
  };
}
