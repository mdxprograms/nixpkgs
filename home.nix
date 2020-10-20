{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bat
      clang
      cmake
      coreutils
      direnv
      emacs
      fd
      fzf
      ghc
      jq
      lua5_1
      nodejs-14_x
      pipenv
      purescript
      python3
      ripgrep
      spago
    ];

    file.".doom.d" = {
      source = ./.doom.d;
      recursive = true;
      onChange = builtins.readFile ./doom-sync.sh;
    };
  };


  programs = {
    home-manager.enable = true;

    neovim = {
      enable = true;
      vimAlias = true;
      extraConfig = builtins.readFile ./nvimConfig.vim;

      plugins = with pkgs.vimPlugins; [
        auto-pairs
        coc-nvim
        devdocs-vim
        emmet-vim
        fzf-vim
        gruvbox
        nerdcommenter
        nim-vim
        rainbow
        ultisnips
        undotree
        vim-airline
        vim-devicons
        vim-dispatch
        vim-fugitive
        vim-gitgutter
        vim-go
        vim-indent-guides
        vim-jsdoc
        vim-manpager
        vim-merginal
        vim-nix
        vim-polyglot
        vim-snippets
        vim-startify
        vim-surround
      ];
    };

    git = {
      enable = true;
      userName = "mdxprograms";
      userEmail = "mdx.programs@gmail.com";
    };
  };
}
