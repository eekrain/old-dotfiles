{ config, pkgs, ... }:
{
  imports = [
    ./browser.nix
  ];

  home.packages = with pkgs; [
    yarn2nix
    numix-gtk-theme

    vscode
    discord
    neovim
    winbox
    mpv
  ];
}
