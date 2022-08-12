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
      device = "nodev";
      efiSupport = true;
      devices = [ "nodev" ];

      useOSProber = false;


      extraEntries = ''
        menuentry "NixOS - Default" --class nixos --unrestricted {
        search --set=drive1 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
        search --set=drive2 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
          linux ($drive2)/nix/store/2ybv1pydzh7jylm5lfdjc20m4yprkmw4-linux-5.15.56/bzImage init=/nix/store/w0cdc8zwgn1ymalrn3nka41kf2051ha0-nixos-system-nixos-22.05.2019.d9536b9b1e3/init loglevel=4
          initrd ($drive2)/nix/store/sdq5ysh3kpzyj3cprxbzfwpzwxlcr109-initrd-linux-5.15.56/initrd
        }


        submenu "NixOS - All configurations" --class submenu {
        menuentry "NixOS - Configuration 5 (2022-08-13 - 22.05.2019.d9536b9b1e3)" --class nixos {
        search --set=drive1 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
        search --set=drive2 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
          linux ($drive2)/nix/store/2ybv1pydzh7jylm5lfdjc20m4yprkmw4-linux-5.15.56/bzImage init=/nix/store/w0cdc8zwgn1ymalrn3nka41kf2051ha0-nixos-system-nixos-22.05.2019.d9536b9b1e3/init loglevel=4
          initrd ($drive2)/nix/store/sdq5ysh3kpzyj3cprxbzfwpzwxlcr109-initrd-linux-5.15.56/initrd
        }

        menuentry "NixOS - Configuration 4 (2022-08-12 - 22.05.2019.d9536b9b1e3)" --class nixos {
        search --set=drive1 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
        search --set=drive2 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
          linux ($drive2)/nix/store/2ybv1pydzh7jylm5lfdjc20m4yprkmw4-linux-5.15.56/bzImage init=/nix/store/4qizd9fym1pa8949vbr3hgwwplsbl5qn-nixos-system-nixos-22.05.2019.d9536b9b1e3/init loglevel=4
          initrd ($drive2)/nix/store/sdq5ysh3kpzyj3cprxbzfwpzwxlcr109-initrd-linux-5.15.56/initrd
        }

        menuentry "NixOS - Configuration 3 (2022-08-12 - 22.05.2019.d9536b9b1e3)" --class nixos {
        search --set=drive1 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
        search --set=drive2 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
          linux ($drive2)/nix/store/2ybv1pydzh7jylm5lfdjc20m4yprkmw4-linux-5.15.56/bzImage init=/nix/store/amnnfvl2ndpb55n87w4m3ld1fnkyfmi8-nixos-system-nixos-22.05.2019.d9536b9b1e3/init loglevel=4
          initrd ($drive2)/nix/store/sdq5ysh3kpzyj3cprxbzfwpzwxlcr109-initrd-linux-5.15.56/initrd
        }

        menuentry "NixOS - Configuration 2 (2022-08-12 - 22.05.2019.d9536b9b1e3)" --class nixos {
        search --set=drive1 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
        search --set=drive2 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
          linux ($drive2)/nix/store/2ybv1pydzh7jylm5lfdjc20m4yprkmw4-linux-5.15.56/bzImage init=/nix/store/3xvl32a3i1irm8fsz958lclb7q22h5h2-nixos-system-nixos-22.05.2019.d9536b9b1e3/init loglevel=4
          initrd ($drive2)/nix/store/sdq5ysh3kpzyj3cprxbzfwpzwxlcr109-initrd-linux-5.15.56/initrd
        }

        menuentry "NixOS - Configuration 1 (2022-08-12 - 22.05.2019.d9536b9b1e3)" --class nixos {
        search --set=drive1 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
        search --set=drive2 --fs-uuid 74c9ef46-ccaa-4096-9ccb-670b9849b21b
          linux ($drive2)/nix/store/2ybv1pydzh7jylm5lfdjc20m4yprkmw4-linux-5.15.56/bzImage init=/nix/store/wcw2l3qsrh87z550cnzcpwwiqkszjbm7-nixos-system-nixos-22.05.2019.d9536b9b1e3/init loglevel=4
          initrd ($drive2)/nix/store/sdq5ysh3kpzyj3cprxbzfwpzwxlcr109-initrd-linux-5.15.56/initrd
        }

        }
        menuentry 'Arch Linux (on /dev/sdb2)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-a737cad4-85d7-49af-bd66-72d8bcd986e6' {
          insmod part_gpt
          insmod fat
          set root='hd1,gpt1'
          if [ x$feature_platform_search_hint = xy ]; then
            search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt1 --hint-efi=hd1,gpt1 --hint-baremetal=ahci1,gpt1  E636-EFDE
          else
            search --no-floppy --fs-uuid --set=root E636-EFDE
          fi
          linux /vmlinuz-linux-zen root=UUID=a737cad4-85d7-49af-bd66-72d8bcd986e6 rw rootfstype=ext4 loglevel=3 quiet
          initrd /intel-ucode.img
        }
        submenu 'Advanced options for Arch Linux (on /dev/sdb2)' $menuentry_id_option 'osprober-gnulinux-advanced-a737cad4-85d7-49af-bd66-72d8bcd986e6' {
          menuentry 'Arch Linux (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/vmlinuz-linux-zen--a737cad4-85d7-49af-bd66-72d8bcd986e6' {
            insmod part_gpt
            insmod fat
            set root='hd1,gpt1'
            if [ x$feature_platform_search_hint = xy ]; then
              search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt1 --hint-efi=hd1,gpt1 --hint-baremetal=ahci1,gpt1  E636-EFDE
            else
              search --no-floppy --fs-uuid --set=root E636-EFDE
            fi
            linux /vmlinuz-linux-zen root=UUID=a737cad4-85d7-49af-bd66-72d8bcd986e6 rw rootfstype=ext4 loglevel=3 quiet
            initrd /intel-ucode.img
          }
          menuentry 'Arch Linux, with Linux linux-zen (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/vmlinuz-linux-zen--a737cad4-85d7-49af-bd66-72d8bcd986e6' {
            insmod part_gpt
            insmod fat
            set root='hd1,gpt1'
            if [ x$feature_platform_search_hint = xy ]; then
              search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt1 --hint-efi=hd1,gpt1 --hint-baremetal=ahci1,gpt1  E636-EFDE
            else
              search --no-floppy --fs-uuid --set=root E636-EFDE
            fi
            linux /vmlinuz-linux-zen root=UUID=a737cad4-85d7-49af-bd66-72d8bcd986e6 rw rootfstype=ext4 loglevel=3 quiet
            initrd /intel-ucode.img
          }
          menuentry 'Arch Linux, with Linux linux-zen (fallback initramfs) (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/vmlinuz-linux-zen--a737cad4-85d7-49af-bd66-72d8bcd986e6' {
            insmod part_gpt
            insmod fat
            set root='hd1,gpt1'
            if [ x$feature_platform_search_hint = xy ]; then
              search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt1 --hint-efi=hd1,gpt1 --hint-baremetal=ahci1,gpt1  E636-EFDE
            else
              search --no-floppy --fs-uuid --set=root E636-EFDE
            fi
            linux /vmlinuz-linux-zen root=UUID=a737cad4-85d7-49af-bd66-72d8bcd986e6 rw rootfstype=ext4 loglevel=3 quiet
            initrd /intel-ucode.img
          }
        }
      '';
    };
  };

  # File systems.
  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  swapDevices = [ ];

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
