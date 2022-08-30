{ config, pkgs, ... }:
{
  imports = [
    ./browser.nix
    ./neovim
  ];

  home.packages = with pkgs; [
    yarn2nix
    vscode
    discord
    winbox
    mpv
    cava
  ];
}
