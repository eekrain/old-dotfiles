{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      redshift
      brightnessctl
      xfce.thunar
      xfce.exo
      trash-cli
    ];
  };

  programs.dconf.enable = true;

  services = {
    gnome.gnome-keyring.enable = true;
    upower.enable = true;
    acpid.enable = true;
    devmon.enable = true;
  };

  security = {
    polkit.enable = true;
  };
}
