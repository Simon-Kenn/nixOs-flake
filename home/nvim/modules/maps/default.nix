{
  imports = [
    ./bepo.nix
  ];

  programs.neovim.extraConfig = ''
    let mapleader=" "
    let maplocalleader=","
  '';
}
