{ config, pkgs, ... }:
{
  xdg.dataFile."fonts".source = ./fonts;
  xdg.dataFile."fonts".recursive = true;

  xdg.configFile."bspwm".source = ./bspwm-config;
  xdg.configFile."bspwm".recursive = true;

  xdg.configFile."wezterm".source = ./wezterm;
  xdg.configFile."sxhkd".source = ./sxhkd;
  xdg.configFile."sxhkd".recursive = true;

  programs = {
    eww = {
      enable = true;
      configDir = ./eww;
    };
  };
}
