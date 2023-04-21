{
  config,
  lib,
  pkgs,
  self,
  ...
}: {
  programs.fish = {
    enable = true;
    # Enable direnv, a tool for managing shell environments
    interactiveShellInit = ''
      eval (${pkgs.starship}/bin/starship init fish | source)
      eval (${pkgs.direnv}/bin/direnv hook fish)
    '';
  };
}
