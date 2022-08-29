{ config, pkgs, ... }:
{
  imports = [
    ./sxhkd
    ./dunst
    ./picom
  ];

  xdg.configFile."bspwm".source = ./bspwm-config;
  xdg.configFile."bspwm".recursive = true;
  xdg.configFile."rofi".source = ./rofi;
  xdg.configFile."rofi".recursive = true;
  xdg.configFile."bin".source = ./bin;
  xdg.configFile."bin".recursive = true;

  programs = {
    eww = {
      enable = true;
      configDir = ./eww;
    };
  };
}
