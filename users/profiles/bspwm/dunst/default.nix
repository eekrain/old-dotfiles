{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ libnotify ];

  xdg.configFile."dunst/dunstrc".source = ./dunstrc;
  xdg.configFile."dunst/assets".source = ./assets;
  xdg.configFile."dunst/assets".recursive = true;
  xdg.configFile."dunst/scripts".source = ./scripts;
  xdg.configFile."dunst/scripts".recursive = true;
  xdg.configFile."dunst/scripts".executable = true;
  services.dunst.enable = true;
}
