{ lib, profile, ... }:

let
  userName = profile.user.name;
  userDescription = profile.user.description;
  isSuper = profile.user.isSuper;
in
{
  users.users.${userName} = {
    isNormalUser = true;
    description = userDescription;
    extraGroups = lib.optionals isSuper [ "wheel" ];
  };
}
