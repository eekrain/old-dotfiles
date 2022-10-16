{ lib, stdenv, sources, ... }:

stdenv.mkDerivation
{
  # version will resolve to the latest available on gitub
  inherit (sources.my-bspwm-custom-fonts) pname version src;

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/share/fonts/{truetype,opentype}
    find . -name '*.otf' -exec install -Dt $out/share/fonts/opentype {} \;
    find . -name '*.ttf' -exec install -Dt $out/share/fonts/truetype {} \;
  '';

  meta = with lib; {
    description = "Bspwm custom fonts for github:eekrain/dotfiles";
    homepage = "https://github.com/eekrain/dotfiles";
    license = licenses.unfree;
    platforms = platforms.all;
    maintainers = with maintainers; [ eekrain ];
  };
}
