{ pkgs, ... }:
{
  xdg.dataFile."fonts".source = ./fonts;

  home.packages = with pkgs; [ vscode ];
}
