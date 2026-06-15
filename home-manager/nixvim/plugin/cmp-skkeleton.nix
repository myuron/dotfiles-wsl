
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
    name = "cmp-skkeleton";
    src = sources.cmp-skkeleton.src;
    nvimSkipModule = [ "cmp_skkeleton" ];
  })];
}
