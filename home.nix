{ config, pkgs, user, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in

{
  home.username = user;
  home.homeDirectory = "/Users/${user}";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    # cli i use constantly
    ripgrep   # fast search
    fd        # fast find
    fzf       # fuzzy finder
    jq        # json on the command line
    lazygit
    neovim
    nerd-fonts.hack
  ];
  fonts.fontconfig.enable = true;
  home.sessionVariables.EDITOR = "nvim";

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;      # ghost text from history
    syntaxHighlighting.enable = true;  # commands turn green when valid
    initContent = ''
      bindkey '^f' autosuggest-accept

      # Source nvm installed by Homebrew
      export NVM_DIR="$HOME/.nvm"

      # Dynamically find the nvm installation path via brew
      if [ -s "$(brew --prefix nvm)/nvm.sh" ]; then
        . "$(brew --prefix nvm)/nvm.sh"
      fi

      # Optional: Load bash completion if desired
      if [ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ]; then
        . "$(brew --prefix nvm)/etc/bash_completion.d/nvm"
      fi

      # Ensure Homebrew completions are in the search path
      if [ -d "$(brew --prefix)/share/zsh/site-functions" ]; then
        fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
      fi
    '';
    shellAliases = {
      ".." = "cd ..";
      ga = "git add";
      gs = "git status";
      gc = "git commit";
      gch = "git checkout";
      gph = "git push";
      pull = "git pull";
      gri = "git rebase -i";
      gd = "git diff";
      gf = "git fetch --all";
      gm = "git switch main";
      gb = "git branch";
      grc = "git rebase --continue";
      cc = "claude --dangerously-skip-permissions";
      co = "codex --full-auto";
      k = "kubectl";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };
      cmd_duration.format = "[$duration]($style) ";
    };
  };

  # Edit-in-place: the real file stays in my repo, ~/.config just points at it.
  home.file.".config/wezterm".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/wezterm";
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/nvim";
  home.file.".config/herdr".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/herdr";
  home.file.".claude/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.claude/settings.json";
  home.file.".config/opencode/opencode.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/opencode/opencode.json";


  home.file.".claude/CLAUDE.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".codex/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".config/opencode/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
}
