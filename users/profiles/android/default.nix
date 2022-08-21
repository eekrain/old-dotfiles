{ config, lib, pkgs, ... }: {

  imports = [ android-nixpkgs.hmModule ];

  inherit config lib pkgs;
  android-sdk.enable = true;

  android-sdk.packages = sdk: with sdk; [
    build-tools-31-0-0
    cmdline-tools-latest
    emulator
    platforms-android-31
    sources-android-31
  ];
}
