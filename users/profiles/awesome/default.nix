{ pkgs, ... }:
{
  xdg.dataFile."fonts".source = ./fonts;
  xdg.configfile."awesome".source = ./awesome;
}
