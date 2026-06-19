{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      leaf
      leaf-convert
      doom-themes
      doom-modeline
      org-roam
      org-pomodoro
      vertico
    ];
    extraConfig = builtins.readFile ./init.el;
  };
}
