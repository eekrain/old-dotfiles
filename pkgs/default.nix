final: prev: {
  # keep sources this first
  sources = prev.callPackage (import ./_sources/generated.nix) {};

  # then, call packages with `final.callPackage`
  configure-gtk = final.callPackage (import ./hyprland/configure-gtk.nix) {};
  dbus-hyprland-environment = final.callPackage (import ./hyprland/dbus-hyprland-environment.nix) {};
}
