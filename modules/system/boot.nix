{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "btusb.enable_autosuspend=0"
  ];

  boot.kernelModules = [
    "kvm_intel"
  ];

  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";

  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.supportedFilesystems = [ "ntfs" ];

  boot.extraModprobeConfig = ''
    options rtw89_pci disable_clkreq=y disable_aspm_l1=y disable_aspm_l1ss=y
  '';
}
