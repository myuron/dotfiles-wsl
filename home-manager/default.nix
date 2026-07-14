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
      godef
      tldr
      nix-search-tv
      yazi
      vim-startuptime
      fzf
      llm-agents.claude-code
      claude-agent-acp
      kubectl
      (lowPrio minikube)
      nix-output-monitor
      tree-sitter
      nvfetcher
      skkDictionaries.l
      zenn-cli
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      hackgen-font
      hackgen-nf-font
      nixd
      awscli2
      ssm-session-manager-plugin
      tirith
      bun
      rustc
      cargo
      rust-analyzer
    ];
  };

  imports = [
    ./nixvim
    ./emacs
    ./zellij
    ./fish.nix
    ./direnv.nix
    ./television.nix
    ./zoxide.nix
    ./claude-code.nix
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
