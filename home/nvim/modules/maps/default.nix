{
  imports = [
    ./bepo.nix
  ];

  programs.neovim.extraConfig = ''
    let g:mapleader=" "
    let g:maplocalleader=","
  '';
}
