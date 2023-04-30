{ suites, config, lib, pkgs, modulesPath, ... }:
{
  ### root password is empty by default ###
  imports = suites.base;

  boot = {
    # Kernel
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
      kernelModules = [ "dm-snapshot" "amdgpu" ];
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    supportedFilesystems = [ "ntfs" ];

    # Bootloader.

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        version = 2;
        efiSupport = true;
        devices = [ "nodev" ];
        useOSProber = true;
      };
    };
  };

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/d25df5b5-ea12-4fd4-ada9-70adfed1cb9f";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/FE9B-C952";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/1b0f5252-b68e-4633-89fc-c6e47ded615b";
      fsType = "ext4";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/24301a58-6e1d-4ed1-8bf4-b4964e6e9da9";
      fsType = "ext4";
    };

  fileSystems."/home/eekrain/Windows" = {
    device = "/dev/disk/by-uuid/1670BBA270BB8751";
    fsType = "ntfs3";
    options = [ "rw" "uid=1000" ];
  };


  swapDevices =
    [{ device = "/dev/disk/by-uuid/28fbf037-2ed8-483d-8354-52b2e609a3fd"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
