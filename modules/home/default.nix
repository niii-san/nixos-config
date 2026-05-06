{ pkgs, ... }:
{
  imports = [
    ./rofi/default.nix
    ./firefox/default.nix
    ./window-managers/default.nix # window managers
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
    ./discord/default.nix
    ./yazi/default.nix
    ./noctalia/default.nix
    ./tools.nix
    ./cc/default.nix
    ./obs-studio/default.nix

    ./xdg-portal.nix
    ./brave/default.nix
    ./fish/default.nix
    ./deploy-files.nix
    # ./flake-pkgs.nix
  ];

  home.sessionPath = [ "$HOME/.local/bin" ];
  home.username = "nishansys";
  home.homeDirectory = "/home/nishansys";
  home.stateVersion = "25.11";


}
