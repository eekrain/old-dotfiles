{
  programs.git = {
    enable = true;

    extraConfig = {
      pull.rebase = false;
    };

    userName = "eekrain";
    userEmail = "ardianoption@gmail.com";
  };
}
