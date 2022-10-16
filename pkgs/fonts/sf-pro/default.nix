{ lib, stdenv, sources, ... }:

stdenv.mkDerivation
{
  # version will resolve to the latest available on gitub
  inherit (sources.sf-pro) pname version src;

  installPhase = ''
    mkdir -p $out/share/fonts/{truetype,opentype}
    find . -name '*.otf' -exec install -Dt $out/share/fonts/opentype {} \;
    find . -name '*.ttf' -exec install -Dt $out/share/fonts/truetype {} \;
  '';

  meta = with lib; {
    description = "San Francisco Pro fonts by Apple";
    homepage = "https://developer.apple.com/fonts/";
    license = licenses.unfree;
    platforms = platforms.all;
    maintainers = with maintainers; [ sagikazarmark ];
  };
}
