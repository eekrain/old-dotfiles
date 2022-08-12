{ pkgs, ... }:
{
  xdg.dataFile."fonts".recursive = ./fonts;
  xdg.configfile."awesome".recursive = ./awesome;
}
