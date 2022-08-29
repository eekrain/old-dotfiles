{ config, pkgs, ... }:
{
  imports = [
    ./sxhkd
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
