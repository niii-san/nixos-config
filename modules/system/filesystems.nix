{ ... }:
{
  # Auto mount
  fileSystems."/run/media/nishansys/lw" = {
    device = "/dev/disk/by-label/lw";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };
}
