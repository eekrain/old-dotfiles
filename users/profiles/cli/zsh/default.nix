{ config, pkgs, ... }:
let
  text = "+_comps";
in
{
  home.packages = with pkgs; [ zinit awscli2 nodejs-16_x yarn nhost-cli ];

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
      kill-gradle = "pkill -f '.*GradleDaemon.*'";
    };

    loginExtra = ''
      python ${config.xdg.configHome}/zsh/zhist_bkp/index.py -b -p $HOME/.zsh_history
    '';

    initExtraBeforeCompInit = ''
      export ZINIT_HOME="${pkgs.zinit}/share/zinit"
      source "''${ZINIT_HOME}/zinit.zsh"
    '';

    # Enable Zi completions
    completionInit = ''
      autoload -Uz _zinit
      (( ''${${text}} )) && _comps[zinit]=_zinit
    '';


    initExtra = ''
      # z
      zinit ice wait blockf lucid
      zinit light skywind3000/z.lua

      # z tab completion
      zinit ice wait lucid
      zinit light changyuheng/fz

      # z / fzf (ctrl-g)
      zinit ice wait lucid
      zinit light andrewferrier/fzf-z

      # cd
      zinit ice wait lucid
      zinit light changyuheng/zsh-interactive-cd

      # Don't bind these keys until ready
      bindkey -r '^[[A'
      bindkey -r '^[[B'
      function __bind_history_keys() {
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down
      }
      # History substring searching
      zinit ice wait lucid atload'__bind_history_keys'
      zinit light zsh-users/zsh-history-substring-search

      # autosuggestions, trigger precmd hook upon load
      zinit ice wait lucid atload'_zsh_autosuggest_start'
      zinit light zsh-users/zsh-autosuggestions
      export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10


      eval "$(${pkgs.starship}/bin/starship init zsh)"
      eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
      
      macchina 
    '';


    # zplug = {
    #   enable = true;
    #   plugins = [
    #     { name = "zsh-users/zsh-history-substring-search"; }
    #     { name = "davidde/git"; tags = [ ''hook-load:"unalias gco gbd"'' ]; }
    #     # { name = "grimmbraten/gitgo"; }
    #     { name = "TwoPizza9621536/zsh-exa"; }
    #     { name = "aubreypwd/zsh-plugin-fd"; }
    #     { name = "skywind3000/z.lua"; }
    #     { name = "marlonrichert/zsh-autocomplete"; }
    #     { name = "eekrain/zsh-aws"; tags = [ defer:2 ]; }
    #     { name = "zsh-users/zsh-autosuggestions"; tags = [ defer:2 ]; }
    #     { name = "z-shell/F-Sy-H"; tags = [ defer:3 ]; }
    #   ];
    # };

  };
}
