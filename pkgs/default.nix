final: prev: {
  # keep sources this first
  sources = prev.callPackage (import ./_sources/generated.nix) { };
  # then, call packages with `final.callPackage`
  papirus-icon-theme = prev.callPackage ./papirus-icon-theme.nix { };
}
