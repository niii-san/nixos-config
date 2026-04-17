{ ... }:
{
  fileSystems."/mnt/lw" = {
    device = "/dev/disk/by-label/lw";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];

  };

}
