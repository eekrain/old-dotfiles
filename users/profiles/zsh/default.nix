{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ awscli2 nodejs-16_x yarn ];

  xdg.configFile."zsh/zhist_bkp".source = ./zhist_bkp;

  programs.zsh = {
    enable = true;

    history = {

      size = 10000;
      save = 10000;
    };

    shellAliases = {
      c = "clear";
      rb = "reboot";
      update = "sudo nixos-rebuild switch";
      b-hist = "python ${config.xdg.configHome}/zsh/zhist_bkp/index.py -b -p $HOME/.zsh_history";
      r-hist = "python ${config.xdg.configHome}/zsh/zhist_bkp/index.py -r -p $HOME/.zsh_history";
    };

    loginExtra = ''
      python ${config.xdg.configHome}/zsh/zhist_bkp/index.py -b -p $HOME/.zsh_history
    '';

    initExtra = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
      eval "$(${pkgs.direnv}/bin/direnv hook zsh)"

      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      neofetch
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-history-substring-search"; }
        { name = "davidde/git"; tags = [ ''hook-load:"unalias gco gbd"'' ]; }
        { name = "grimmbraten/gitgo"; }
        { name = "TwoPizza9621536/zsh-exa"; }
        { name = "aubreypwd/zsh-plugin-fd"; }
        { name = "skywind3000/z.lua"; }
        { name = "marlonrichert/zsh-autocomplete"; }
        { name = "eekrain/zsh-aws"; tags = [ defer:2 ]; }
        { name = "zsh-users/zsh-autosuggestions"; tags = [ defer:2 ]; }
        { name = "z-shell/F-Sy-H"; tags = [ defer:3 ]; }
      ];
    };

  };
}
