{ config, pkgs, ... }:
{
  imports = [
    ./browser.nix
  ];

  home.packages = with pkgs; [
    yarn2nix
    numix-gtk-theme
    nur.repos.ambroisie.volantes-cursors

    vscode
    discord
    neovim
    winbox
    mpv
    cava
  ];
}
