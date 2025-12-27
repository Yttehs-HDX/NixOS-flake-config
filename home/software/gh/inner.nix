{ pkgs, ... }:

{
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    extensions = [ pkgs.gh-copilot ];
  };
}
