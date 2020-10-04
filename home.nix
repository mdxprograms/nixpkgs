{ config, pkgs, ... }:

{
  home = {
    username = "josh";
    homeDirectory = "/home/josh";
    stateVersion = "20.09";

    packages = with pkgs; [
      alacritty
      bat
      direnv
      firefox
      fzf
      ghc
      jq
      neovim
      nodejs-14_x
      pipenv
      python3
      ripgrep
    ];
  };

  programs = {
    home-manager = {
      enable = true;
      path = "...";
    };

    neovim = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "mdxprograms";
      userEmail = "mdx.programs@gmail.com";
    };

    firefox = {
      enable = true;
      profiles = {
        myprofile = {
          settings = {
            "general.smoothScroll" = false;
          };
        };
      };
    };

    fzf = {
      enable = true;
    };
  };
}
