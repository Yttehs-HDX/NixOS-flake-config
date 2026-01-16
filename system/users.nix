{ lib, profile, ... }:

let
  # Extract all user profiles from the system profile
  userProfiles = profile.users or {};
  
  # Create user configurations for each user
  mkUserConfig = name: userProfile: {
    isNormalUser = true;
    description = userProfile.user.description or name;
    extraGroups = lib.optionals (userProfile.user.isSuper or false) [ "wheel" ];
  };
in
{
  users.users = lib.mapAttrs mkUserConfig userProfiles;
}
