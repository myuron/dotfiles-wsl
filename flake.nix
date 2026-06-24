{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    llm-agents.url = "github:numtide/llm-agents.nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixos-wsl,
      llm-agents,
      home-manager,
      nixvim,
      treefmt-nix,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = treefmt-nix.lib.mkWrapper pkgs {
        projectRootFile = "flake.nix";
        programs = {
          nixfmt.enable = true; # nix
          taplo.enable = true; # toml
        };
      };

      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./nixos
          nixos-wsl.nixosModules.default
        ];
      };

      homeConfigurations."home" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            llm-agents.overlays.default
          ];
        };
        modules = [
          ./home-manager
          nixvim.homeModules.nixvim
        ];
      };

      apps.${system} = {
        nixos = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "nixos build..." ''
              set -e
              echo "==> build nixos"
              sudo nixos-rebuild switch --flake .#nixos
            ''
          );
        };

        home = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "home-manager build..." ''
              set -e
              echo "==> build home-manager"
              nix run nixpkgs#home-manager -- switch --flake .#home
            ''
          );
        };
      };
    };
}
