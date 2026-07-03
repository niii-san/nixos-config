{
  description = "NixOS";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    claude-code = {
      url = "github:sadjow/claude-code-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    burpsuitepro = {
      type = "github";
      owner = "xiv3r";
      repo = "Burpsuite-Professional";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixvim,
      nur,
      claude-code,
      ...
    }:
    {

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";
        modules = [
          ./modules/system/default.nix
          ./hardware-configuration.nix
          inputs.niri.nixosModules.niri

          {
            nixpkgs.overlays = [
              nur.overlays.default
              claude-code.overlays.default
            ];
            nixpkgs.config.allowUnfree = true;

            environment.systemPackages = with nixpkgs.legacyPackages.x86_64-linux; [
              claude-code
            ];

          }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = {
                inherit nixvim inputs;

              };

              users.nishansys = import ./modules/home/default.nix;
              backupFileExtension = "backup";

              sharedModules = [
                nixvim.homeModules.nixvim
                inputs.noctalia.homeModules.default
              ];

            };
          }

        ];

      };
    };
}
