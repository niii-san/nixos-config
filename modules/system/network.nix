{ ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  networking.firewall.trustedInterfaces = [ "virbr0" ]; # virtual machine
}
