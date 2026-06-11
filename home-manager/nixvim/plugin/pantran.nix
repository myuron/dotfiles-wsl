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
