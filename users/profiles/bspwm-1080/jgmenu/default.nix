{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ jgmenu ];

  xdg.configFile."jgmenu".source = ./jgmenu;
  xdg.configFile."jgmenu".recursive = true;
}
