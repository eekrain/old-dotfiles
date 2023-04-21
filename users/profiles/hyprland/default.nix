{ config, pkgs, ... }:
{
  imports = [
    "./mako.nix"
  ];

  xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
}
