{ config, pkgs, ... }:
{
  imports = [
    ./jgmenu
    ./sxhkd
    ./dunst
    ./picom
  ];
  home.packages = with pkgs; [ wmutils-opt tabbed ];


  xdg.configFile."bspwm".source = ./bspwm-config;
  xdg.configFile."bspwm".recursive = true;
  xdg.configFile."rofi".source = ./rofi;
  xdg.configFile."rofi".recursive = true;
  xdg.dataFile."bin".source = ./bin;
  xdg.dataFile."bin".recursive = true;
  xdg.configFile."gtk-3.0".source = ./gtk-3.0;

  programs = {
    eww = {
      enable = true;
      configDir = ./eww;
    };
  };
}
