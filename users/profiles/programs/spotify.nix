{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    spicetify-cli
    nur.repos.instantos.spotify-adblock
  ];

  # xdg.desktopEntries.spotify = {
  #   type = "Application";
  #   name = "Spotify";
  #   genericName = "Music Player";
  #   icon = "spotify-client";
  #   exec = "${pkgs.spotify}/bin/spotify %U";
  #   terminal = false;
  #   mimeType = [ "x-scheme-handler/spotify" ];
  #   categories = [ "Audio" "Music" "Player" "AudioVideo" ];
  #   settings = {
  #     StartupWMClass = "spotify";
  #   };
  # };
}
