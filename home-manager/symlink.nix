{ config, ... }:
{
  home.file.".emacs.d/init.el" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/github.com/myuron/dotfiles-wsl/emacs/init.el";
  };
}
