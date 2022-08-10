{ profiles, ... }:
{
  imports = [
    # profiles.networking
    profiles.core.nixos
    profiles.users.root # make sure to configure ssh keys
    profiles.users.eekrain # make sure to configure ssh keys
  ];

  boot.loader.systemd-boot.enable = true;

  # Required, but will be overridden in the resulting installer ISO.

  # fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/3543649e-326d-452d-8656-374b408c2d9a";
      fsType = "ext4";
    };

  swapDevices = [ ];
}
