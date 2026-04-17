{ config, ... }:
{
  xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=${config.home.homeDirectory}/Images/Screenshots
    save_filename_format=screenshot-%Y%m%d-%H%M%S.png
    show_panel=false
    line_size=5
    text_size=20
    text_font=sans-serif
    paint_mode=brush
    early_exit=false
    fill_shape=false
    auto_save=false
    custom_color=rgba(193,125,17,1)
  '';

  # Ensure the screenshots directory exists
  home.activation.createScreenshotDir = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ${config.home.homeDirectory}/Images/Screenshots
  '';
}
