{ pkgs, emacs-config, ... }:
{
  programs.emacs-twist = {
    enable = true;
    directory = ".emacs.d";
    createInitFile = true;
    emacsclient.enable = true;
    config = emacs-config.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
