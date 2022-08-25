{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ vscode discord neovim winbox ];

  programs.brave = {
    enable = true;
    extensions = [
      {
        # bitwarden
        id = "nngceckbapebfimnlniiiahkandclblb";
      }
    ];
  };

  xdg = {
    enable = true;
    userDirs.enable = true;
  };
}
