final: prev: {
  picom = prev.picom.overrideAttrs (o: rec{
    inherit (prev.sources.picom-arian8j2-git) version src;
  });
}
