{ lib, stdenv, sources, ... }:

stdenv.mkDerivation
{
  # version will resolve to the latest available on gitub
  inherit (sources.tokyo-night-gtk-theme) pname version src;

  installPhase = ''
    mkdir -p $out/share/themes/
    cp -rf themes/Tokyonight* $out/share/themes/
  '';

  meta = with lib; {
    description = "San Francisco Pro fonts by Apple";
    homepage = "https://developer.apple.com/fonts/";
    license = licenses.unfree;
    platforms = platforms.all;
    maintainers = with maintainers; [ sagikazarmark ];
  };
}
