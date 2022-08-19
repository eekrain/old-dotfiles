{ config, hmUsers, pkgs, ... }:
{
  home-manager.users = { inherit (hmUsers) eekrain; };

  users.users.eekrain = {
    name = "eekrain";
    passwordFile = config.age.secrets.mysecret.path;
    # password = "eka";
    description = "eekrain";
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxsf" ];
    shell = pkgs.zsh;
  };
}
