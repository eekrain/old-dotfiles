{ lib, stdenv, sources, ... }:

stdenv.mkDerivation
{
  # version will resolve to the latest available on gitub
  inherit (sources.my-bspwm-custom-fonts) pname version src;

  unpackPhase = ''
    runHook preUnpack
    mkdir ${pname}-${version}
    tar -C ${pname}-${version} -xzf $src
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/{truetype,opentype}
    find ${pname}-${version} -name '*.otf' -exec install -Dt $out/share/fonts/opentype {} \;
    find ${pname}-${version} -name '*.ttf' -exec install -Dt $out/share/fonts/truetype {} \;
    runHook postInstall
  '';

  meta = with lib; {
    description = "Bspwm custom fonts for github:eekrain/dotfiles";
    homepage = "https://github.com/eekrain/dotfiles";
    license = licenses.unfree;
    platforms = platforms.all;
    maintainers = with maintainers; [ eekrain ];
  };
}
