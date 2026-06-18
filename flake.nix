{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-wsl,
      nixvim,
      llm-agents,
      ... 
    }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
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
          program = toString (pkgs.writeShellScript "home-manager build..." ''
            set -e
            echo "==> build nixos"
            sudo nixos-rebuild switch --flake .#nixos
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
