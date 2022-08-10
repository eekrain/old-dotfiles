{
  programs.fish = {
    enable = true;
    promptInit = ''
      eval (${pkgs.starship}/bin/starship init fish | source)
    '';
    # Enable direnv, a tool for managing shell environments
    interactiveShellInit = ''
      eval (${pkgs.direnv}/bin/direnv hook fish)
    '';
  };
}
