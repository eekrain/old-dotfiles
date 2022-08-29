{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      python3Full
      rofi
    ];
  };

  services = {
    xserver = {
      windowManager.bspwm.enable = true;
    };
  };
}
