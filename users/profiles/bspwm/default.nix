{ config, pkgs, ... }:
{
  imports = [
    ./jgmenu
    ./sxhkd
    ./dunst
    ./picom
  ];

  xdg.configFile."bspwm".source = ./bspwm-config;
  xdg.configFile."bspwm".recursive = true;
  xdg.configFile."rofi".source = ./rofi;
  xdg.configFile."rofi".recursive = true;
  xdg.dataFile."bin".source = ./bin;
  xdg.dataFile."bin".recursive = true;

  programs = {
    eww = {
      enable = true;
      configDir = ./eww;
    };
  };
}
