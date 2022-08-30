{ lib
, stdenv
, ...
}:
stdenv.mkDerivation {
  name = "tabbed";
  pname = "tabbed";
  src = ./tabbed; # Get the ... part with nix-prefetch-github
  phases = [ "installPhase" ];
  installPhase = "mkdir -p $out/bin; cp $src $out/bin/tabbed";
}
