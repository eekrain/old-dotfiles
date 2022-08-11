{ config, ... }:
{
  submoduleSupport.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.dataHome}/.zsh_history";
    };
  };
  xdg.configFile."zsh/zsh_history".source = ./zsh_history;
}
