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
      inputs.nixpkgs.follows = "nixpkgs";

    };

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      nur,
      ...
    }:
    {

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";
        modules = [
          ./modules/system/default.nix
          ./hardware-configuration.nix

          {
            nixpkgs.overlays = [ nur.overlays.default ];
            nixpkgs.config.allowUnfree = true;
          }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = {
                inherit nixvim;
              };

              users.nishansys = import ./modules/home/default.nix;
              backupFileExtension = "backup";

              sharedModules = [
                nixvim.homeModules.nixvim
              ];

            };
          }

        ];

      };
    };
}
