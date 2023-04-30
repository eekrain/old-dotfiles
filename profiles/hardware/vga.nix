{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
