{ config, pkgs, android-nixpkgs, ... }:

let
  android-sdk = android-nixpkgs.sdk (sdkPkgs: with sdkPkgs;
    [
      cmdline-tools-latest
      build-tools-32-0-0
      platform-tools
      platforms-android-31
      emulator
    ]);
in
{
  environment.systemPackages = with pkgs; [
    # IDE
    android-tools
    android-sdk
    android-studio
    flutter
  ];
  environment.variables = {
    ANDROID_SDK_ROOT = "${android-sdk}/share/android-sdk";
    ANDROID_HOME = "$ANDROID_SDK_ROOT";
  };
}
