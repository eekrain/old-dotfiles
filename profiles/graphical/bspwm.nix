{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      rofi
    ];
  };

  services = {
    xserver = {
      windowManager.bspwm.enable = true;
    };
  };
}
