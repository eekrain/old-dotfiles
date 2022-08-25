{ hmUsers, pkgs, ... }:
{
  home-manager.users = { inherit (hmUsers) eekrain; };

  users.users.eekrain = {
    name = "eekrain";
    password = "eka";
    description = "eekrain";
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxsf" "adbusers" "libvirtd" "networkmanager" ];
    shell = pkgs.zsh;

    xdg = {
      enable = true;
      userDirs.enable = true;
    };
  };
}
