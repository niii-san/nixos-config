{ pkgs, ... }:
{
  users.users.nishansys = {
    isNormalUser = true;
    description = "nishansys";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "docker"
    ];
    shell = pkgs.bash;
  };
}
