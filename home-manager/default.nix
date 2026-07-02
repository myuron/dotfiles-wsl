{ config, pkgs, ... }:
{
  home = {
    username = "myuron";
    homeDirectory = "/home/myuron";
    stateVersion = "26.05";
    packages = with pkgs; [
      wget
      lazygit
      lazydocker
      git
      gh
      ghq
      jq
      eza # enhanced version of ls
      bat # enhanced version of cat
      ripgrep # enhanced version of grep
      fd # enhanced version of find
      viddy # enhanced version of watch
      duf # enhanced version of df
      delve
      gopls
      tldr
      nix-search-tv
      yazi
      vim-startuptime
      fzf
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
      tirith
    ];
  };

  imports = [
    ./nixvim
    ./emacs
    ./zellij
    ./fish.nix
    ./direnv.nix
    ./television.nix
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
