{ config, pkgs, ... }:
{
  home = {
    username = "myuron";
    homeDirectory = "/home/myuron";
    stateVersion = "25.11";
    packages = with pkgs; [
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
      llm-agents.claude-code
      kubectl
      minikube
      nix-output-monitor
      tree-sitter
      nvfetcher
      skkDictionaries.l
      zenn-cli
      nerd-fonts.jetbrains-mono
      nixd
      awscli2
      ssm-session-manager-plugin
    ];
  };

  imports = [
    ./nixvim
    ./emacs
    ./fish.nix
    ./direnv.nix
    ./television.nix
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
