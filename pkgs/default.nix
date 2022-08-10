final: prev: {
  # keep sources this first
  sources = prev.callPackage (import ./_sources/generated.nix) { };
  # then, call packages with `final.callPackage`
  sf-pro = prev.callPackage ./fonts/sf-pro { };
  picom-jonaburg-git = prev.callPackage ./graphical/picom-jonaburg-git { };
}
