{ suites, config, lib, pkgs, modulesPath, ... }:
{
  ### root password is empty by default ###
  imports = [ suites.example suites.mysql ];

  # Kernel
  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "sd_mod" "sr_mod" "xhci_pci" "ahci" "usb_storage" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/b1f15aed-8120-4c4f-9683-669cb866ce0b";
      fsType = "ext4";
    };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 75;
  };




  # Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      version = 2;
      useOSProber = true;
      device = "/dev/sda";
    };
  };

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
  powerManagement = {
    enable = true;
    cpuFreqGovernor = lib.mkDefault "ondemand";
    cpufreq.min = 400000;
    cpufreq.max = 2267000;
  };
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  systemd.services.upower.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
