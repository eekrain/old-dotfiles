{
  hmUsers,
  pkgs,
  ...
}: {
  home-manager.users = {inherit (hmUsers) eekrain;};

  users.users.eekrain = {
    name = "Ardian Eka Candra";
    password = "eka";
    description = "eekrain";
    isNormalUser = true;
    extraGroups = ["wheel" "vboxsf" "adbusers" "libvirtd" "networkmanager" "docker"];
    shell = pkgs.zsh;
  };
}
