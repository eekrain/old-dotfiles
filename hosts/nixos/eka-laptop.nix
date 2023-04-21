{ suites, config, lib, pkgs, modulesPath, ... }:
{
  ### root password is empty by default ###
  imports = suites.base;

  # Kernel
  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
      kernelModules = [ "dm-snapshot" ];
      luks.devices = {
        root.device = "/dev/disk/by-uuid/f6458200-a8be-4ec3-87de-f108d37b9750";
      };
    };
    kernelModules = [ "kvm-amd" ];
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

  # fileSystems."/" = {
  #   device = "/dev/disk/by-label/root";
  #   fsType = "ext4";
  # };

  # fileSystems."/boot" = {
  #   device = "/dev/disk/by-partlabel/boot";
  #   fsType = "vfat";
  # };

  # fileSystems."/nix" = {
  #   device = "/dev/disk/by-label/nix-store";
  #   fsType = "ext4";
  # };

  # fileSystems."/home" = {
  #   device = "/dev/disk/by-label/home";
  #   fsType = "ext4";
  # };

  # fileSystems."/home/eekrain/External" = {
  #   device = "/dev/disk/by-label/ntfs";
  #   fsType = "ntfs3";
  #   options = [ "rw" "uid=1000" ];
  # };


  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/f6a52199-cc9a-46f7-877c-9532a139918a";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-uuid/B091-396F";
      fsType = "vfat";
    };



  swapDevices = [ ];
  # swapDevices =
  #   [{ device = "/dev/disk/by-label/swap"; }];

  # Networking
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;

  networking.extraHosts =
    ''
      127.0.0.1 local.mydomain.com
    '';


  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };
  };
  # Bluetooth audio settings for pipewire
  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      }
    '';
  };

  # Hardware Spesific
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  systemd.services.upower.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
