{ pkgs, inputs,  ... }: 
let 
# Create a custom derivation for the Neovim configuration
  nvimConfig = pkgs.stdenv.mkDerivation {
    name = "nvim-config";
    src = inputs.lazyvim-starter;
    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';
  };
in
{
  # Required
  home.username = "lynx";
  home.homeDirectory = "/home/lynx";
  home.stateVersion = "23.11";  # Match your NixOS version

  # Add packages here
  home.packages = with pkgs; [
    git
    fastfetch
    neovim
    ghostty    
    brightnessctl
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-powerlevel10k
    vscodium
    qutebrowser
    ripgrep
    lazygit
    fd
    gcc
    mpv
  ];

  # Optional program configurations
  
  programs.ghostty = {
    enable = true;
    
    settings = {
      theme = "catppuccin-mocha";
      font-size = 24;
      confirm-close-surface = false;
    };
  };

  programs.fastfetch = {
    enable = true;
    
    settings = {
	    logo = {
	      source = "nixos_small";
	      padding = {
	        right = 1;
	      };
	    };
    };
  };

  programs.zsh = {
  
  enable = true;
  plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    initExtra = ''
      # Source your p10k configuration
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
  
  # Place your p10k.zsh configuration in the correct location
  home.file.".p10k.zsh".source = ./p10k.zsh;
  
  home.file.".config/nvim" = {
    source = nvimConfig;
    recursive = true;  # Copy all files and directories
  };

  programs.chromium.enable = true;
  programs.git = {
    enable = true;
    userName = "LYNX";
    userEmail = "ramzanlynx@outlook.com";
  };
}
