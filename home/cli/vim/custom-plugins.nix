{  pkgs, ... }:
{
  catppuccin = pkgs.vimUtils.buildVimPlugin {
    name = "catppuccin";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "vim";
      rev = "5280d241fe6a4f4ddef17078a215b81a113388e8";
      sha256 = "KV0UuDIsJuyLA0AEJChryXEndOkk1U0J8Pk0Xuw7CtE=";
    };
  };
}
