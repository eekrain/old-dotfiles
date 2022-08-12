final: prev: {
  awesome = prev.awesome.overrideAttrs (o: rec{
    inherit (prev.sources.awesome-git) version src;
  });
}
