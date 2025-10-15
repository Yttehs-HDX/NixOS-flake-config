{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history.size = 100000;

    historySubstringSearch.enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      c = "clear";
      v = "nvim";
      whats = "gh copilot explain";
      howto = "gh copilot suggest";
      ai = "tgpt -i";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
        "extract"
        "tmux"
        "tldr"
        "history"
        "sudo"
        "command-not-found"
        "vscode"
      ];
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };

    initContent = ''
      source ~/.p10k.zsh
    '';
  };
}

