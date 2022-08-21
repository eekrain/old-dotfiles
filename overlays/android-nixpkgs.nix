{ config, lib, pkgs, inputs, ... }:
{
  # android-nixpkgs overlay
  nixpkgs.overlays = [
    inputs.android-nixpkgs.overlay
  ];
}
