{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      python3Full
      rofi
      bsp-layout
      i3lock-color
      libcanberra-gtk3
    ];
  };

  services = {
    xserver = {
      windowManager.bspwm.enable = true;
    };
  };
}
