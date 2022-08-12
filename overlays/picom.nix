final: prev: {
  picom = prev.picom.overrideAttrs (o: rec{
    inherit (prev.sources.picom-git) version src;
  });
}
