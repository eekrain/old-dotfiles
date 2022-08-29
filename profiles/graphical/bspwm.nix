{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      python3Full
      rofi
      bsp-layout
    ];
  };

  services = {
    xserver = {
      windowManager.bspwm.enable = true;
    };
  };
}
