{ pkgs, ... }:
{
  home.packages = with pkgs; [ vscode discord ];

  programs.brave.enable = true;
}
