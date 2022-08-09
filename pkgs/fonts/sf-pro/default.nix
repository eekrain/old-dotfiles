{ lib, stdenv, sources, ... }:

stdenv.mkDerivation
{
  pname = "sf-pro";

  # version will resolve to the latest available on gitub
  inherit (sources.libinih) version src;

  installPhase = ''
    mkdir -p $out/share/fonts/{truetype,opentype}
    cp *.ttf $out/share/fonts/truetype/
    cp *.otf $out/share/fonts/opentype/
  '';

  meta = with lib; {
    description = "San Francisco Pro fonts by Apple";
    homepage = "https://developer.apple.com/fonts/";
    license = licenses.unfree;
    platforms = platforms.all;
    maintainers = with maintainers; [ sagikazarmark ];
  };
}
