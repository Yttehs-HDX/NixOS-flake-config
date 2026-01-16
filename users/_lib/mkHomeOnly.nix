{ lib, nixpkgs, nur, home-manager, hexecute, nixvim, homeModules }:
{ system ? "x86_64-linux", username, userProfile, userModule }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  
  # For standalone home-manager, we only use the user profile (no host profile)
  profile = userProfile;
in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;
  
  modules = [
    userModule
  ] ++ homeModules;
  
  extraSpecialArgs = {
    nur = nur.legacyPackages.${system}.repos;
    inherit hexecute nixvim profile;
  };
}
