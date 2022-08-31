final: prev: {
  bspwm = prev.bspwm.overrideAttrs (o: rec{
    inherit (prev.sources.bspwm-rounded-corners) version src;
  });
}
