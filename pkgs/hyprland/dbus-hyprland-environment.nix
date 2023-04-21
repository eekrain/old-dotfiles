{ pkgs, ... }:
pkgs.writeTextFile {
  name = "dbus-hyprland-environment";
  destination = "/bin/dbus-hyprland-environment";
  executable = true;

  text = ''
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=hyprland
    systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
  '';
}
