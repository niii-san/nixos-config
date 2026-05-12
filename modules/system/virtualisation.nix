{ pkgs, config, ... }:

{

  # Docker
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  # Virtual Machine (QEMU/KVM)

  users.groups.libvirtd.members = [ "nishansys" ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true; # TPM support
      vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

  # UEFI firmware symlink fix
  systemd.tmpfiles.rules = [
    "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"
  ];

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
