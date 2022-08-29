{ config, pkgs, ... }:
{
  imports = [
    ./sxhkd
    ./dunst
  ];

  xdg.configFile."bspwm".source = ./bspwm-config;
  xdg.configFile."bspwm".recursive = true;
  programs = {
    eww = {
      enable = true;
      configDir = ./eww;
    };
  };
}
