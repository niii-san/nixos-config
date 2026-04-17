{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awww
    papirus-icon-theme
    adw-gtk3
    waypaper

    pavucontrol
    networkmanagerapplet
    swaynotificationcenter # for swaync-client
    nwg-drawer
    nwg-menu

    yazi
    brave
    lf

    

    fastfetch

    gthumb
    mpv
    postman
    spotify
    zathura

    #waybar
    swaynotificationcenter
    playerctl
    networkmanagerapplet

    # hypr
    hypridle
    hyprlock
    wlr-randr # display management
    cliphist

    kitty

    libreoffice-fresh
    vscode-fhs

    # Screenshot tools
    grim
    slurp
    swappy
    grimblast
    imagemagick
    libnotify

  ];
}
