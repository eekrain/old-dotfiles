{ pkgs, ... }:
{
  home.packages = with pkgs; [ vscode discord neovim winbox ];

  # xdg = {
  #   enable = true;
  #   userDirs.enable = true;
  # };

  programs.brave = {
    enable = true;
    extensions = [
      {
        # bitwarden
        id = "nngceckbapebfimnlniiiahkandclblb";
      }
    ];
  };
}
