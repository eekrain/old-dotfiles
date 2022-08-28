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

  location.provider = "manual";
  location.latitude = -7.8;
  location.longitude = 110.3;

  services = {
    gnome.gnome-keyring.enable = true;
    upower.enable = true;
    acpid.enable = true;
    redshift.enable = true;
    mpd.enable = true;


    dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };

    picom.enable = true;

    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [ "nvidia" ];

      libinput = {
        enable = true;
        touchpad.disableWhileTyping = true;
      };

      windowManager.awesome.enable = true;
      # displayManager.defaultSession = "none+awesome";
      desktopManager.xterm.enable = false;
      # disable automatic screen blanking and stuff, we'll do it manually instead
      serverFlagsSection = ''
        Option "BlankTime" "0"
        Option "StandbyTime" "0"
        Option "SuspendTime" "0"
        Option "OffTime" "0"
      '';
    };
  };
  hardware.opengl.enable = true;

  security = {
    polkit.enable = true;
  };

  programs.nm-applet.enable = true;
}
