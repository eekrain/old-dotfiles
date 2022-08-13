{ suites, config, lib, pkgs, modulesPath, ... }:
{
  ### root password is empty by default ###
  imports = suites.base;

  # Kernel
  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "sd_mod" "sr_mod" "xhci_pci" "ahci" "usb_storage" ];
      kernelModules = [ "kvm-intel" ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
  };


  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    grub = {
      enable = true;
      version = 2;
      efiSupport = true;

      # Enable this 
      useOSProber = true;

      # Disable this on fresh install
      # devices = [ "nodev" ];

      # extraEntries = ''
      #   menuentry 'Arch Linux (on /dev/sdb2)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-a737cad4-85d7-49af-bd66-72d8bcd986e6' {
      #     insmod part_gpt
      #     insmod fat
      #     set root='hd1,gpt1'
      #     if [ x$feature_platform_search_hint = xy ]; then
      #       search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt1 --hint-efi=hd1,gpt1 --hint-baremetal=ahci1,gpt1  E636-EFDE
      #     else
      #       search --no-floppy --fs-uuid --set=root E636-EFDE
      #     fi
      #     linux /vmlinuz-linux-zen root=UUID=a737cad4-85d7-49af-bd66-72d8bcd986e6 rw rootfstype=ext4 loglevel=3 quiet
      #     initrd /intel-ucode.img
      #   }
      #   submenu 'Advanced options for Arch Linux (on /dev/sdb2)' $menuentry_id_option 'osprober-gnulinux-advanced-a737cad4-85d7-49af-bd66-72d8bcd986e6' {
      #     menuentry 'Arch Linux (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/vmlinuz-linux-zen--a737cad4-85d7-49af-bd66-72d8bcd986e6' {
      #       insmod part_gpt
      #       insmod fat
      #       set root='hd1,gpt1'
      #       if [ x$feature_platform_search_hint = xy ]; then
      #         search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt1 --hint-efi=hd1,gpt1 --hint-baremetal=ahci1,gpt1  E636-EFDE
      #       else
      #         search --no-floppy --fs-uuid --set=root E636-EFDE
      #       fi
      #       linux /vmlinuz-linux-zen root=UUID=a737cad4-85d7-49af-bd66-72d8bcd986e6 rw rootfstype=ext4 loglevel=3 quiet
      #       initrd /intel-ucode.img
      #     }
      #     menuentry 'Arch Linux, with Linux linux-zen (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/vmlinuz-linux-zen--a737cad4-85d7-49af-bd66-72d8bcd986e6' {
      #       insmod part_gpt
      #       insmod fat
      #       set root='hd1,gpt1'
      #       if [ x$feature_platform_search_hint = xy ]; then
      #         search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt1 --hint-efi=hd1,gpt1 --hint-baremetal=ahci1,gpt1  E636-EFDE
      #       else
      #         search --no-floppy --fs-uuid --set=root E636-EFDE
      #       fi
      #       linux /vmlinuz-linux-zen root=UUID=a737cad4-85d7-49af-bd66-72d8bcd986e6 rw rootfstype=ext4 loglevel=3 quiet
      #       initrd /intel-ucode.img
      #     }
      #     menuentry 'Arch Linux, with Linux linux-zen (fallback initramfs) (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/vmlinuz-linux-zen--a737cad4-85d7-49af-bd66-72d8bcd986e6' {
      #       insmod part_gpt
      #       insmod fat
      #       set root='hd1,gpt1'
      #       if [ x$feature_platform_search_hint = xy ]; then
      #         search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt1 --hint-efi=hd1,gpt1 --hint-baremetal=ahci1,gpt1  E636-EFDE
      #       else
      #         search --no-floppy --fs-uuid --set=root E636-EFDE
      #       fi
      #       linux /vmlinuz-linux-zen root=UUID=a737cad4-85d7-49af-bd66-72d8bcd986e6 rw rootfstype=ext4 loglevel=3 quiet
      #       initrd /intel-ucode.img
      #     }
      #   }
      # '';
    };
  };

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
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
