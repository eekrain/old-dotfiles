{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    android-studio
    jdk
    watchman
  ];
}
