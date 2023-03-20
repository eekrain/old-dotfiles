{ config, pkgs, ... }:
{
  imports = [
    ./browser.nix
    ./spotify.nix
    ./neovim
  ];

  home.packages = with pkgs; [
    vscode
    discord
    winbox
    mpv
    cava
    ferdium
  ];
}
