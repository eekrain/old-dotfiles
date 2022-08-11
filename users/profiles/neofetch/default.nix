{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ neofetch material-design-icons ];

  xdg.configFile."neofetch".source = ./config;
}
