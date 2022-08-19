{ self, config, ... }:
# recommend using `hashedPassword`
{
  age.secrets.master_passwd.file = "${self}/secrets/master_passwd.age";

  # users.users.root.password = "eka";
  users.users.root.passwordFile = config.age.secrets.master_passwd.path;
}
