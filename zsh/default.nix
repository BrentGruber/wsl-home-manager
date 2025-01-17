{ pkgs, ... }: {
  # adding this section here so that when bash loads
  # it automatically opens a zsh
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      zsh
    '';
  };

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    enableAutosuggestions = true;
    history.size = 10000;
    history.share = true;

    plugins = [
      {
	name = "powerlevel10k-config";
	src = ./p10k.zsh;
	file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
	src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
	file = "powerlevel10k.zsh-theme";
      }
    ];

    initExtra = ''
      # autoSuggestions config

      unsetopt correct

      setopt hist_ignore_all_dups #remove older duplicate entries from history
      setopt hist_reduce_blanks #remove superfluous blanks from history items
      setopt inc_append_history #save history entries as soon as they are entered

      #auto complete options
      setopt auto_list #automatically list choices on ambiguous completion
      setopt auto_menu #automaticall use menu completion
      zstyle ':completion:*' menu select #select completions with arrow keys
      zstyle ':completion:*' group-name "" #group results by category
      zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
	"sudo" # pres esc twice to get the previous command prefixed with sudo
      ];
      extraConfig = ''
        #Display red dots while waiting for completion
	COMPLETION_WAITING_DOTS="true"
      '';
    };

    shellAliases = {
      # Overrides those provided by OMZ libs, plugins, and themes
      # For a full list of active aliases run `alias`.

      #-------Navigation
      ls = "eza";
      ll = "eza -l";
     };
  };
}
