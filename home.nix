  {config, pkgs,  ... }:

  {
    home.username = "lynx";
    home.homeDirectory = "/home/lynx";
    #home.stateVersion = "24.11";
    #home.file.".p10k.zsh".source = ./p10k.zsh;

    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      
      initExtra = ''
        export PATH=$HOME/.local/bin:$PATH

      '';

      shellAliases = {
	btw = "echo i use Nix Os BY THE WAY!";
      };
    };
    
    home.sessionVariables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
    
    #programs.starship.enable = true;    

    home.packages = with pkgs; [
      starship
      ghostty
      fastfetch
      chromium
      git
      wget
      neovim
      sl
    ];    
  }
