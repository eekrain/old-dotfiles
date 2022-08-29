{ config, pkgs, ... }:
{
  imports = [
    ./sxhkd
    ./dunst
    ./picom
  ];

  xdg.configFile."bspwm".source = ./bspwm-config;
  xdg.configFile."bspwm".recursive = true;
  # xdg.configFile."picom".source = ./picom;
  programs = {
    eww = {
      enable = true;
      configDir = ./eww;
    };
  };
}
