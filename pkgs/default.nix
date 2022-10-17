final: prev: {
  # keep sources this first
  sources = prev.callPackage (import ./_sources/generated.nix) { };
  # then, call packages with `final.callPackage`
  sf-pro = prev.callPackage ./fonts/sf-pro { };
  my-bspwm-custom-fonts = prev.callPackage ./fonts/my-bspwm-custom-fonts { };
  nhost-cli = prev.callPackage ./development/nhost-cli { };
  x11-emoji-picker = prev.callPackage ./graphical/x11-emoji-picker { };
  tokyo-night-gtk-theme = prev.callPackage ./graphical/tokyo-night-gtk-theme { };
}
