{ pkgs, config, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true; # TPM emulation (needed for Win11)
    };
  };

  # Needed for NAT networking in VMs
  virtualisation.spiceUSBRedirection.enable = true;

  # Add your user to the required groups
  users.users.nishansys = {
    # replace with your actual username
    extraGroups = [
      "libvirtd"
      "kvm"
      "qemu-libvirtd"
    ];
  };

  # Kernel modules
  boot.kernelModules = [ "kvm-intel" ];

  environment.systemPackages = with pkgs; [
    virt-manager # GUI for managing VMs
    virt-viewer # Display client for VMs
    spice-gtk # SPICE protocol support (better display)
    virtio-win# VirtIO drivers (if running Windows guests)
  ];
}
