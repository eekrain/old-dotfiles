{ pkgs, ... }:
{
  home.packages = with pkgs; [ gh ];

  programs = {
    git = {
      enable = true;

      extraConfig = {
        pull.rebase = false;
      };

      userName = "Ardian Eka Candra";
      userEmail = "ardianoption@gmail.com";
    };
  };
}
