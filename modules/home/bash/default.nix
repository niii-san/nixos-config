{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {

      "ff" = "clear && fastfetch";
      "fm" = "yazi";
      "cdlw" = "cd /run/media/nishansys/lw";

    };

    bashrcExtra = ''
      if [[ $- == *i* ]]; then
        fastfetch
        source /etc/profiles/per-user/nishansys/etc/profile.d/hm-session-vars.sh
      fi
    '';

  };

  home.sessionVariables = {
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
    PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
    PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";
  };
}
