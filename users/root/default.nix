{ ... }:
# recommend using `hashedPassword`
{
  # users.users.root.password = "eka";
  users.users.root.passwordFile = "/run/agenix/master_passwd";
}
