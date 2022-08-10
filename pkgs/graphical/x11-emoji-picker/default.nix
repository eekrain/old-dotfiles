{ lib
, stdenv
, sources
, cmake
, extra-cmake-modules
, qt5
, icu
, xdotool
, ...
}:
stdenv.mkDerivation rec {
  inherit (sources.x11-emoji-picker) pname version src;

  strictDeps = true;
  buildInputs = [
    qt5.qtbase
    icu
    xdotool
  ];
  nativeBuildInputs = [ cmake extra-cmake-modules qt5.wrapQtAppsHook ];

  installPhase = ''
    mkdir -p $out/bin
    mv emoji-picker $out/bin
  '';

  meta = with lib; {
    description = "X11 Emoji Picker";
    homepage = "https://github.com/GaZaTu/x11-emoji-picker";
    license = licenses.mit;
    maintainers = with maintainers; [ GaZaTu ];
    platforms = platforms.unix;
  };
}
