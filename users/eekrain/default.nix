{ hmUsers, pkgs, ... }:
{
  home-manager.users = { inherit (hmUsers) eekrain; };

  users.users.eekrain = {
    name = "eekrain";
    password = "eka";
    description = "eekrain";
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxsf" "adbusers" "libvirtd" "networkmanager" "video" "docker" ];
    shell = pkgs.zsh;
  };
}
