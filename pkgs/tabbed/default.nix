{ lib
, stdenv
, ...
}:
stdenv.mkDerivation {
  name = "tabbed";
  src = ./tabbed; # Get the ... part with nix-prefetch-github
  phases = [ "installPhase" ];
  installPhase = "mkdir -p $out/bin; cp -r $src $out/bin";
}
