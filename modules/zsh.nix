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
        source ${pkgs.spaceship-prompt}/share/zsh/site-functions/prompt_spaceship_setup
        autoload -U promptinit; promptinit
        # Hook direnv
        #emulate zsh -c "$(direnv hook zsh)"

        #eval "$(direnv hook zsh)"
      '';
    };
  };
}
