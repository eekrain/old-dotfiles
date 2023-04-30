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
    ];
  };

  services = {
    xserver = {
      windowManager.bspwm.enable = true;
    };
  };

  programs.nm-applet.enable = true;

  fonts.fonts = with pkgs; [ sf-pro my-bspwm-custom-fonts ];
}
