{ config, lib, pkgs, ... }:
{
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ]''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;

    userName = "Zarthoustra42";
    userEmail = "simon.kenn.public@pm.me";

    extraConfig = {
      url = {
        "ssh://git@gitub.com" = {
          insteadOf = "https://github.com";
        };
        "ssh://git@gilab.com" = {
          insteadOf = "https://gitlab.com";
        };
        "ssh://git@gitbucket.com" = {
          insteadOf = "https://gitbucket.com";
        };
      };
      delta = {
        enable = true;
      };  
    };

    aliases = {
      a = "add";
      c = "commit";
      ca = "commit --amend";
      can = "commit --amend --no-edit";
      cl = "clone";
      cm = "commit -m";
      co = "checkout";
      cp = "cherry-pick";
      cpx = "cherry-pick -x";
      d = "diff";
      f = "fetch";
      fo = "fetch origin";
      fu = "fetch upstream";
      lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
      lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
      pl = "pull";
      pr = "pull -r";
      ps = "push";
      psf = "push -f";
      rb = "rebase";
      rbi = "rebase -i";
      r = "remote";
      ra = "remote add";
      rr = "remote rm";
      rv = "remote -v";
      rs = "remote show";
      st = "status";
    };
  };
}
