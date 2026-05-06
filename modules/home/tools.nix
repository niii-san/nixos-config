{ pkgs, ... }:
{

  home.packages = with pkgs; [
    wireshark
  ];

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.atuin = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };

}
