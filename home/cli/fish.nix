{
  programs.fish = {
    enable = true;

    shellAliases = {
      nvim = "nix run ~/Projets/config/neovim --";
    };
  };
}
