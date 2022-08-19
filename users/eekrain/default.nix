{ self, config, hmUsers, pkgs, ... }:
{
  age.secrets.master_passwd.file = "${self}/secrets/master_passwd.age";

  home-manager.users = { inherit (hmUsers) eekrain; };

  users.users.eekrain = {
    name = "eekrain";
    passwordFile = config.age.secrets.master_passwd.path;
    # password = "eka";
    description = "eekrain";
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxsf" ];
    shell = pkgs.zsh;
  };
}
