{ lib
, stdenv
, ...
}:
stdenv.mkDerivation {
  name = "chwb2";
  pname = "chwb2";
  src = ./chwb2; # Get the ... part with nix-prefetch-github
  phases = [ "installPhase" ];
  installPhase = "mkdir -p $out/bin; cp -r $src $out/bin/chwb2";
}
