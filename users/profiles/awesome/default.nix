{ config, pkgs, ... }:
{
  xdg.dataFile."fonts".source = ./fonts;
  xdg.dataFile."fonts".recursive = true;

  xdg.configFile."awesome".source = ./awesome-config;
  xdg.configFile."awesome".recursive = true;

  xdg.configFile."mpd".source = ./mpd;
  xdg.configFile."mpDris2".source = ./mpDris2;
  xdg.configFile."ncmpcpp".source = ./ncmpcpp;
  xdg.configFile."wezterm".source = ./wezterm;

}
