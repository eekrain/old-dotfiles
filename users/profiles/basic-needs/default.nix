{ config, pkgs, ... }:
{
  imports = [
    ./browser.nix
  ];

  home.packages = with pkgs; [ vscode discord neovim winbox ];
}
