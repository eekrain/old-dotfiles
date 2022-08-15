{ suites, config, lib, pkgs, modulesPath, ... }:
{
  ### root password is empty by default ###
  imports = suites.base;

  # Kernel
  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "sd_mod" "sr_mod" "xhci_pci" "ahci" "usb_storage" ];
      kernelModules = [ "dm-snapshot" ];
      luks.devices = {
        root.device = "/dev/disk/by-uuid/fa088126-27e2-41fa-ab8f-90748b34ea89";
      };
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };


  # Bootloader.
  boot.loader = {
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


  fileSystems."/" =
    {
      device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-label/nix-store";
      fsType = "ext4";
      neededForBoot = true;
      options = [ "noatime" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-label/home";
      fsType = "ext4";
    };

  swapDevices =
    [{ device = "/dev/disk/by-label/swap"; }];


  # Networking
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;

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

    mpd = {
      enable = true;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
      user = "eekrain";
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
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  systemd.services.upower.enable = true;

  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
