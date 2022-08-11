{ config, pkgs, ... }:
{
  submoduleSupport.enable = true;

  xdg.configFile."zsh/zhist_bkp".source = ./zhist_bkp;

  programs.zsh = {
    enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch";
      b-hist = "python ${config.xdg.configHome}/zsh/zhist_bkp/index.py -b -p $HOME/.zsh_history";
      r-hist = "python ${config.xdg.configHome}/zsh/zhist_bkp/index.py -r -p $HOME/.zsh_history";
    };

    loginExtra = ''
      python ${config.xdg.configHome}/zsh/zhist_bkp/index.py -b -p $HOME/.zsh_history
    '';

    initExtra = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
      eval "$(${pkgs.direnv}/bin/direnv hook fish)"
    '';

    history = {
      size = 10000;
      save = 10000;
    };
  };
}
