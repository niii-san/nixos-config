{
  pkgs,
  ...
}:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"
      "oboonakemofpalcgghocfoadofidjkkk"
      "kgcjekpmcjjogibpjebkhaanilehneje"
      "abbpaepbpakcpipajigmlpnhlnbennna"
      "gebbhagfogifgggkldgodflihgfeippi"
      "fmkadmapgofadopljbjfkapdkoienihi"
    ];
  };

}
