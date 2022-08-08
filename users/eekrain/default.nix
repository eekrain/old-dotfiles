{ hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) eekrain; };

  users.users.eekrain = {
    password = "eka";
    description = "default";
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxsf" ];
  };
}
