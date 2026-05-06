{ pkgs, ... }:
{


  programs.fish.enable = true;

  users.users.nishansys = {
    isNormalUser = true;
    description = "nishansys";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "docker"
      "wireshark"
    ];
    # shell = pkgs.bash;
    shell = pkgs.fish;
  };
}
