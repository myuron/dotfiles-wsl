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
    name = "skkeleton";
    src = sources.skkeleton.src;
  })];
  autoCmd = [
    {
      event = "User";
      pattern = "DenopsPluginPost:skkeleton";
      callback.__raw = ''
        function()
          vim.fn["skkeleton#config"]({
            globalDictionaries = {
              { "${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L", "euc-jp" },
            },
          })
        end
      '';
    }
  ];
  keymaps = [
    {
      mode = "i";
      key = "<C-j>";
      action = "<Plug>(skkeleton-toggle)";
    }
  ];
}
