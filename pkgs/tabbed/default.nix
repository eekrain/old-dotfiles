{ lib
, stdenv
, ...
}:
stdenv.mkDerivation {
  name = "tabbed";
  pname = "tabbed";
  src = ./src; # Get the ... part with nix-prefetch-github
  phases = [ "installPhase" ];
  installPhase = "mkdir -p $out/bin; cp -r $src $out/bin";
}
