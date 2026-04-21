{
  hostname = "darkgui-vps"; # Replace with your desired hostname.
  username = "nixos"; # Replace with your desired username.
  sshKey = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHr63aXlTSmorypxb689ApdqjEmyTKJbLtelYsvQpBdu darkgui@protonmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJZyQIEUCZPUJBocZGx/MUq/WWRSP6O1+rOB2kWHV6Lm u0_a369@localhost"
  ]; # Replace with your SSH public key.
  locale = "pt_BR.UTF-8";
  timezone = "America/Bahia";
}
