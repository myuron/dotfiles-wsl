{
  programs.zellij = {
    enable = true;
    extraConfig = builtins.readFile ./config.kdl;
  };

  xdg.configFile."zellij/layouts/dev.kdl".source = ./layouts/dev.kdl;
}
