{ ... }:
{
  services.xserver = {
    gnome.gnome-keyring.enable = true;
    upower.enable = true;

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

      windowManager.awesome.enable = true;
      displayManager.defaultSession = "none+awesome";
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
}
