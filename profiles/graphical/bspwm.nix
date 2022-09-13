{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      python3Full
      rofi
      bsp-layout
      i3lock-color
      libcanberra-gtk3
      mpc-cli
      mpd
      mpdris2
      iwgtk
    ];
  };

  services = {
    xserver = {
      windowManager.bspwm.enable = true;
    };
  };
}
