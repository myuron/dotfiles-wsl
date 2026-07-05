{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      doom-themes
    ];
    extraConfig = builtins.readFile ./init.el;
  };
}
