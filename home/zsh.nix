{ pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      #syntaxHighlighting.enable = true;
      enableCompletion = true;
      history.size = 100000;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };

      initExtra = ''                            # Zsh theme
        # Spaceship
        eval "$(starship init zsh)"
      '';

    };
  };
}
