{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      rofi
      lxappearance
      inotify-tools
      polkit_gnome
      xclip
      gpick
      ffmpeg
      brightnessctl
      feh
      maim
      mpc-cli
      mpv
      mpd
      mpdris2
      python3Full
      python39Packages.mutagen
      ncmpcpp
      playerctl
    ];
  };


  services = {
    mpd.enable = true;

    xserver = {
      windowManager.awesome.enable = true;
    };
  };

  programs.nm-applet.enable = true;
}
