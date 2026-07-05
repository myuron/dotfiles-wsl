{
  config,
  lib,
  pkgs,
  ...
}:
{
  wsl = {
    enable = true;
    defaultUser = "myuron";
  };

  networking.resolvconf.enable = false;

  virtualisation.docker.enable = true;

  programs = {
    fish.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  users.users.myuron = {
    shell = pkgs.fish;
    extraGroups = [ "docker" ];
  };

  system.stateVersion = "25.11";

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    allow-import-from-derivation = true;
    sandbox = true;
  };
}
