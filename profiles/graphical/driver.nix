{ config, pkgs, ... }:
{
  hardware = {
    nvidia.modesetting.enable = true;
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ vaapiIntel ];
    };
  };

  services.xserver.videoDrivers = [ "intel" "nvidia" ];
}
