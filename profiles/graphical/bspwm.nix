{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      rofi
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
      displayManager.defaultSession = "none+bspwm";
      desktopManager.xterm.enable = false;
      # disable automatic screen blanking and stuff, we'll do it manually instead
      # serverFlagsSection = ''
      #   Option "BlankTime" "0"
      #   Option "StandbyTime" "0"
      #   Option "SuspendTime" "0"
      #   Option "OffTime" "0"
      # '';
    };
  };

  hardware.opengl.enable = true;

  security = {
    polkit.enable = true;
  };
}
