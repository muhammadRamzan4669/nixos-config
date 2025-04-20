{ pkgs, ... }: {
  # Required
  home.username = "lynx";
  home.homeDirectory = "/home/lynx";
  home.stateVersion = "23.11";  # Match your NixOS version

  # Add packages here
  home.packages = with pkgs; [
    fastfetch
    neovim
    ghostty    
    brightnessctl
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-powerlevel10k
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
  home.file.".config/fastfetch/config.jsonc".text = ''
{
  "logo": {
    "type": "nixos",
    "colors": [ "#7EBAE4", "#5277C3" ],  // Official NixOS colors
    "padding": { 
      "top": 1,
      "right": 2
    }
  },
  "display": {
    "separator": "",  // Nerd Font arrow
    "keyColor": "#7EBAE4",
    "valueColor": "#5277C3"
  }
}
'';


  programs.chromium.enable = true;
  programs.git = {
    enable = true;
    userName = "LYNX";
    userEmail = "ramzanlynx@outlook.com";
  };
}
