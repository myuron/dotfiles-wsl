{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs =
    { nixpkgs, home-manager, nixvim, llm-agents, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./nixos/configuration.nix
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
          ./home-manager/home.nix 
          nixvim.homeModules.nixvim
        ];
      };
      apps.${system} = {
        nixos = {
          type = "app";
          program = toString (pkgs.writeShellScript "home-manager build..." ''
            set -e
            echo "==> build nixos"
            nixos-rebuild switch --flake .#nixos
          '');
        };
        home = {
          type = "app";
          program = toString (pkgs.writeShellScript "home-manager build..." ''
            set -e
            echo "==> build home-manager"
            nix run nixpkgs#home-manager -- switch --flake .#home
          '');
        };
      };
    };
}
