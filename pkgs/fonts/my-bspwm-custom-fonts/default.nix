{ lib, stdenv, sources, ... }:

stdenv.mkDerivation
{
  # version will resolve to the latest available on gitub
  inherit (sources.my-bspwm-custom-fonts) pname version src;

  unpackPhase = ''
    runHook preUnpack
    mkdir ${sources.my-bspwm-custom-fonts.pname}
    tar -C ${sources.my-bspwm-custom-fonts.pname} -xf $src
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/{truetype,opentype}
    find ./${sources.my-bspwm-custom-fonts.pname} -name '*.otf' -exec install -Dt $out/share/fonts/opentype {} \;
    find ./${sources.my-bspwm-custom-fonts.pname} -name '*.ttf' -exec install -Dt $out/share/fonts/truetype {} \;
    runHook postInstall
  '';

  meta = with lib; {
    description = "My bspwm custom fonts for github:eekrain/dotfiles";
    homepage = "https://github.com/eekrain/dotfiles";
    license = licenses.unfree;
    platforms = platforms.all;
    maintainers = with maintainers; [ eekrain ];
  };
}
