{ lib, stdenv, sources, ... }:

stdenv.mkDerivation
{
  # version will resolve to the latest available on gitub
  inherit (sources.nhost-cli) pname version src;

  unpackPhase = ''
    runHook preUnpack
    mkdir ${sources.nhost-cli.pname}
    tar -C ${sources.nhost-cli.pname} -xf $src
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp ./${sources.nhost-cli.pname}/cli $out/bin/nhost
    runHook postInstall
  '';

  meta = with lib; {
    description = "Nhost CLI";
    homepage = "https://github.com/nhost/cli";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ eekrain ];
  };
}
