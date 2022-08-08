{ hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) nixos; };

  users.users.nixos = {
    password = "nixos";
    description = "nixos";
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxsf" ];
  };
}
