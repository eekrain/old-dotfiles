{ config
, pkgs
, lib
, ...
}:
let
  user = import ../../user/username.nix;
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  environment.systemPackages = with pkgs; [
    dbus-hyprland-environment
    configure-gtk
    wayland
    glib
    gnome3.adwaita-icon-theme
    grim
    wl-clipboard
    bemenu
    wlr-randr
    gnome.nautilus
    swaybg

    waybar
    mako
  ];

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    gtkUsePortal = true;
  };

  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  environment.sessionVariables = rec {
    GBM_BACKEND = "nvidia-drm";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    WLR_DRM_NO_ATOMIC = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";

    # Will break SDDM if running X11
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    GDK_BACKEND = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "eekrain";
      };
      default_session = initial_session;
    };
  };

  environment.etc."greetd/environments".text = ''
    Hyprland
  '';
}
