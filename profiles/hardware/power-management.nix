{ config, pkgs, ... }:
{
  services = {
    tlp.enable = true;
    auto-cpufreq.enable = true;
  };
}
