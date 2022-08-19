let
  # set ssh public keys here for your system and user
  eekrain = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAG2IwZWpQgdHs0Fr8Jl2SlZZ3+gGll4pLtozl4oAez/";
  eka-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICJOfjODny9hbeBTqh00cqSjkdoyEu6mWXlEfSdu93EI";

  systems = [ eka-laptop ];
in
{
  "secret.age".publicKeys = [ eekrain ] ++ eka-laptop;
}
