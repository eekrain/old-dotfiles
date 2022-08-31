{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      redshift
      brightnessctl
      xfce.thunar
      xfce.exo
      trash-cli
    ];
  };

  programs.dconf.enable = true;

  services = {
    gnome.gnome-keyring.enable = true;
    upower.enable = true;
    acpid.enable = true;
    devmon.enable = true;


    xserver = {
      enable = true;
      layout = "us";

      libinput = {
        enable = true;
        touchpad.disableWhileTyping = true;
      };

      displayManager.defaultSession = "none+bspwm";
      desktopManager.xterm.enable = false;
    };

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
