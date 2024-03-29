{ suites, config, lib, pkgs, modulesPath, ... }:
{
  ### root password is empty by default ###
  imports = suites.base;

  # Kernel
  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "sd_mod" "sr_mod" "xhci_pci" "ahci" "usb_storage" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  # Bootloader.
  boot = {
    supportedFilesystems = [ "ntfs" ];

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
      device = "/dev/disk/by-uuid/24312f16-b7c6-49ff-918c-f2fbd9d7c60f";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/2212-835F";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Networking
  networking.useDHCP = lib.mkDefault true;

  networking.extraHosts =
    ''
      127.0.0.1 local.mydomain.com
    '';

  # Hardware Spesific
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  systemd.services.upower.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
