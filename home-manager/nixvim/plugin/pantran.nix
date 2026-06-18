{ pkgs, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins.pantran-nvim
  ];
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
