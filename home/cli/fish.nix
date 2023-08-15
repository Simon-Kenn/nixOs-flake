{
  programs.fish = {
    enable = true;

    shellAliases = {
      vim = "nix run ~/Projets/config/neovim --";
      cat = "bat";
      find = "fd";
      grep = "ripgrep";
      ls = "exa";
    };

    shellAbbrs = {
      g = "git";
      gcl = "git clone";
      v = "vim";
      neorg = "nvim";

      ll = "ls -l";
      lla = "ls -la";
    };
  };
}
