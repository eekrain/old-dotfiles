{ config, pkgs, ... }:
{
  location.provider = "manual";
  location.latitude = -7.8;
  location.longitude = 110.3;

  services = {
    gnome.gnome-keyring.enable = true;
    upower.enable = true;
    acpid.enable = true;
    redshift.enable = true;
    picom.enable = true;

    dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };


    xserver = {
      enable = true;
      layout = "us";

      libinput = {
        enable = true;
        touchpad.disableWhileTyping = true;
      };
    };

    displayManager.defaultSession = "none+awesome";
    desktopManager.xterm.enable = false;

    # disable automatic screen blanking and stuff, we'll do it manually instead
    # serverFlagsSection = ''
    #   Option "BlankTime" "0"
    #   Option "StandbyTime" "0"
    #   Option "SuspendTime" "0"
    #   Option "OffTime" "0"
    # '';
  };

  security = {
    polkit.enable = true;
  };
}
