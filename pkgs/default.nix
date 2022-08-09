final: prev: {
  # keep sources this first
  sources = prev.callPackage (import ./_sources/generated.nix) { };
  # then, call packages with `final.callPackage`
  sf_pro = prev.callPackage ./fonts/sf_pro { };
}
