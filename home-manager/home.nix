{ config, pkgs, ... }:
{
  home.username = "myuron";
  home.homeDirectory = "/home/myuron";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  imports = [
    ./nixvim/nixvim.nix
    ./fish.nix
    ./direnv.nix
    ./television.nix
    ./symlink.nix
  ];

  home.packages = with pkgs; [
    wget
    lazygit
    lazydocker
    git
    gh
    ghq
    jq
    ripgrep
    delve
    gopls
    tldr
    nix-search-tv
    fd
    vim-startuptime
    viddy
    fzf
    eza
    bat
    zoxide
    emacs
    llm-agents.claude-code
    kubectl
    minikube
    nix-output-monitor
    tree-sitter
    nvfetcher
    skkDictionaries.l
    zenn-cli
    nerd-fonts.jetbrains-mono
  ];
  home.file = {
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
