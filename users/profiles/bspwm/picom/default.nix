{ pkgs, config, ... }:
{
  home.packages = with pkgs; [ picom ];

  xdg.configFile."picom".source = ./picom;
}
