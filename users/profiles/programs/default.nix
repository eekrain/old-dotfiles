{ config, pkgs, ... }:
{
  imports = [
    ./browser.nix
  ];

  home.packages = with pkgs; [
    yarn2nix
    vscode
    discord
    neovim
    winbox
    mpv
    cava
  ];
}
