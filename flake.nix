{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixvim.url = "github:nix-community/nixvim";
    llm-agents.url = "github:numtide/llm-agents.nix";
    emacs-config.url = "github:myuron/.emacs.d";
    twist.url = "github:emacs-twist/twist.nix";
    home-manager = {
      url = "github:nix-community/home-manager";
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
      nixvim,
      llm-agents,
      emacs-config,
      twist,
      home-manager,
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
          twist.homeModules.emacs-twist
        ];
        extraSpecialArgs = { inherit emacs-config; };
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
