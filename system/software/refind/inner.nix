{ pkgs, ... }: { environment.systemPackages = with pkgs; [ refind ]; }
