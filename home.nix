{ config, pkgs, ... }:

{
  home = {
    username = "josh";
    homeDirectory = "/home/josh";
    stateVersion = "20.09";

    packages = with pkgs; [
      bat
      clang
      clojure
      direnv
      fd
      fzf
      ghc
      jq
      leiningen
      lua5_1
      nodejs-14_x
      pipenv
      python3
      ripgrep
      vifm
    ];

    # file.".doom.d" = {
      # source = "./.doom.d";
      # recursive = true;
      # onChange = readFile "./doom-sync.sh";
    # };
  };


  programs = {
    home-manager = {
      enable = true;
      path = "...";
    };

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
