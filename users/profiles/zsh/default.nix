{ config, ... }:
{
  submoduleSupport.enable = true;

  xdg.configFile."zsh/zhist_bkp.py".source = ./zhist_bkp/index.py;

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
}
