{ pkgs, ... }:
{
  gtk.gtk4.theme = null;

  gtk = {
    enable = true;
    theme = {
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "volantes_cursors";
      package = pkgs.volantes-cursors;
      size = 32;
    };
  };

  home.pointerCursor = {
    name = "volantes_cursors";
    package = pkgs.volantes-cursors;
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };
}
