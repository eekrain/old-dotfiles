final: prev: {
  bspwm = prev.bspwm.overrideAttrs (o: rec{
    inherit (prev.sources.bspwm-rounded) version src;
  });
}
