let
  # set ssh public keys here for your system and user
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICJOfjODny9hbeBTqh00cqSjkdoyEu6mWXlEfSdu93EI";
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAG2IwZWpQgdHs0Fr8Jl2SlZZ3+gGll4pLtozl4oAez/";
  allKeys = [ system user ];
in
{
  "secret.age".publicKeys = allKeys;
}
