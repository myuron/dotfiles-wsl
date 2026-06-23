{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
    functions = {
      ghq-fzf = ''
        set -l repo (ghq list | fzf --cycle --layout=reverse --border --height=90% --prompt="Repo> ")
        if test -n "$repo"
          cd (ghq root)/$repo
        end
        commandline -f repaint
      '';
      fish_prompt = ''
        set -l git_branch (git branch --show-current 2>/dev/null)
        set -l prompt (prompt_pwd)
        if test -n "$git_branch"
          set prompt "$prompt $git_branch"
        end
        echo "$prompt > "
      '';
    };
    shellAbbrs = {
      ls = "eza --icons always --classify";
      ll = "eza --icons always --classify -lh";
      la = "eza --icons always --classify -lha";
      cat = "bat";
      grep = "rg";
      cl = "claude";
      emacs = "emacs --no-window-system";
    };
    shellInit = ''
      bind \cg ghq-fzf
    '';
  };
}
