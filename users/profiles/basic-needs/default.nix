{ pkgs, ... }:
{
  home.packages = with pkgs; [ vscode ];

  programs.brave.enable = true;


}
