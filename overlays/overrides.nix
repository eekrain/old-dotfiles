channels: final: prev: {
  __dontExport = true; # overrides clutter up actual creations

  inherit
    (channels.latest)
    cachix
    dhall
    discord
    element-desktop
    rage
    nix-index
    qutebrowser
    alejandra
    signal-desktop
    starship
    deploy-rs
    bsp-layout
    brave
    wezterm
    neovim
    wmutils-opt
    libcanberra-gtk3
    pavucontrol
    trash-cli
    spotify
    spicetify-cli
    whatsapp-for-linux
    bspwm
    ferdium
    zinit
    ;

  haskellPackages =
    prev.haskellPackages.override
      (old: {
        overrides = prev.lib.composeExtensions (old.overrides or (_: _: { })) (hfinal: hprev:
          let
            version = prev.lib.replaceChars [ "." ] [ "" ] prev.ghc.version;
          in
          {
            # same for haskell packages, matching ghc versions
            inherit
              (channels.latest.haskell.packages."ghc${version}")
              haskell-language-server
              ;
          });
      });
}
