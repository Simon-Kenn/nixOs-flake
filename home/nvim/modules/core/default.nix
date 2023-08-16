{
  programs.neovim.extraConfig = ''
    set enc=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf8,prc

    syntax on
    set ruler
    set visualbell
    set hidden
    set relativenumber number
    set foldmethod=syntax
    set nofoldenable
    set foldlevel=99

    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab
    set smarttab
    set noshiftround
    set autoindent
    set smartindent
  '';
}
