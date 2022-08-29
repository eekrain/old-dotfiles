{ pkgs, config, ... }:
{
  # home.packages = with pkgs; [ wezterm ]; //already added on core profile

  xdg.dataFile."fonts".source = ./fonts;
  xdg.dataFile."fonts".recursive = true;
  xdg.configFile."wezterm/wezterm.lua".source = ./wezterm.lua;
}
