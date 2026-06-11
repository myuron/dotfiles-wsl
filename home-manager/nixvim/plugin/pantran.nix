{ pkgs, ... }:
let
  generated = import ../../../_sources/generated.nix;
  sources = generated {
    inherit (pkgs)
      fetchurl
      fetchFromGitHub
      dockerTools
      fetchgit
      ;
  };
in
{
  extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
    name = "pantran";
    src = sources.pantran.src;
    # src = pkgs.fetchFromGitHub {
    #   owner = "potamides";
    #   repo = "pantran.nvim";
    #   rev = "b87c3ae";
    #   hash = "sha256-b4odpXwh+BmFsK5v3HmSWG43FA+ygOAPU+qFNy6vWDU=";
    # };
  })];
  extraConfigLua = ''
    require("pantran").setup({
      default_engine = "google",
      engines = {
        google = {
          fallback = {
            default_source = "en",
            default_target = "ja",
          },
        },
      },
      window = {
        window_config = { border = "rounded" },
      },
    })
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>Pantran source=ja target=en<CR>";
    }
    {
      mode = "v";
      key = "<leader>tw";
      action = "<cmd>'<,'>Pantran<CR>";
    }
    {
      mode = "v";
      key = "<leader>tr";
      action = "<cmd>'<,'>Pantran source=ja target=en mode=replace<CR>";
    }
  ];
}
