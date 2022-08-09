{ stdenv, meson, ninja, lib, sources, ... }:
stdenv.mkDerivation {
  pname = "libinih";

  # version will resolve to the latest available on gitub
  inherit (sources.libinih) version src;

  buildInputs = [ meson ninja ];

  # ...
}
