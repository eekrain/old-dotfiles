final: prev: {
  picom = prev.manix.overrideAttrs (o: rec{
    inherit (prev.sources.picom-jonaburg-git) version src;
  });
}
