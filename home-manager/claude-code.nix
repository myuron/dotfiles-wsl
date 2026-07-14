{
  programs.claude-code = {
    enable = true;
    # claude-code binary itself is installed via home.packages (llm-agents.claude-code).
    # Let this module manage config files only.
    package = null;
    settings = {
      model = "opus";
      tui = "fullscreen";
      statusLine = {
        type = "command";
        command = "bunx ccusage@latest statusline";
      };
    };
  };
}
