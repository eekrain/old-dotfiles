{ config, pkgs, ... }:
{
  xdg.dataFile."fonts".source = ./fonts;
  xdg.dataFile."fonts".recursive = true;
  xdg.configFile."awesome".source = ./config;
  xdg.configFile."awesome".recursive = true;
}
