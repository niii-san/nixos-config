{ pkgs, ... }:

{
  # Ollama (model runner)
  services.ollama = {
    enable = false;
    package = pkgs.ollama-cuda;

    loadModels = [ "llama3.1:8b" ]; # auto-pulls on rebuild

    environmentVariables = {
      OLLAMA_NOANALYTICS = "1"; # disable telemetry
    };
  };
}
