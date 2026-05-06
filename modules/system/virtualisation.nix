{ pkgs, config, ... }:

{

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true; # TPM emulation
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

  users.users.nishansys = {
    extraGroups = [
      "libvirtd"
      "kvm"
      "qemu-libvirtd"
    ];
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer # SPICE viewer
    virtio-win
    spice-gtk # SPICE GTK client
    dnsmasq # NAT networking
    bridge-utils
    vde2
    iptables
  ];
}
