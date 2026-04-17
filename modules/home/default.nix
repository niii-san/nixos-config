{ pkgs, ... }:
{

  imports = [
    ./rofi/default.nix
    ./firefox/default.nix
    ./hyprland/default.nix
    ./waybar/default.nix
    ./gtk/default.nix
    ./foot/default.nix
    ./bash/default.nix
    ./nixvim/default.nix
    ./swappy/default.nix
    ./packages.nix
    ./virt-manager/default.nix
    ./obsidian/default.nix
    # features
    ./features/screenshot.nix
    ./starship/default.nix
    ./fastfetch/default.nix
    ./tmux/default.nix
    ./cli/default.nix
    ./brave/default.nix
    ./yazi/default.nix
    ./discord/default.nix
  ];

  home.username = "nishansys";
  home.homeDirectory = "/home/nishansys";
  home.stateVersion = "25.11";

}
