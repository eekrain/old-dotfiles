{ self, config, ... }:
# recommend using `hashedPassword`
{
  users.users.root.password = "eka";
}
