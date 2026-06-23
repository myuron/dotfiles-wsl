{
  programs.television = {
    enable = true;
    channels = {
      tldr = {
        metadata = {
          name = "tldr";
          requirements = [ "tldr" ];
        };
        source = {
          command = "tldr --list";
        };
        preview = {
          command = "tldr {}";
        };
      };
      nix = {
        metadata = {
          name = "nix";
          requirements = [ "nix-search-tv" ];
        };
        source = {
          command = "nix-search-tv print";
        };
        preview = {
          command = "nix-search-tv preview {}";
        };
      };
    };
  };
}
