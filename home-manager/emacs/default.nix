{ pkgs, org-babel, ... }:
let
  sources = pkgs.callPackage ../../_sources/generated.nix { };
  tangle = org-babel.lib.tangleOrgBabel { languages = [ "emacs-lisp" ]; };
in
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      modus-themes
      nerd-icons
      nerd-icons-completion
      nerd-icons-corfu
      nerd-icons-dired
      vertico
      vertico-posframe
      marginalia
      orderless
      corfu
      dired-subtree
      evil
      magit
      eat
      eglot
      nix-ts-mode
      go-mode
      rust-mode
      treesit-grammars.with-all-grammars
      (epkgs.melpaBuild {
        pname = "nskk";
        version = "0.2.1";
        src = sources.nskk.src;
        files = ''("src/*.el")'';
        ignoreCompilationError = false;
      })
    ];
  };

  home.file.".emacs.d/early-init.el".text = tangle (builtins.readFile ./early-init.org);
  home.file.".emacs.d/init.el".text = tangle (builtins.readFile ./init.org);
}
