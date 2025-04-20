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
  ];

  # Optional program configurations
  programs.zsh.enable = true;
  programs.chromium.enable = true;
  programs.git = {
    enable = true;
    userName = "LYNX";
    userEmail = "ramzanlynx@outlook.com";
  };
}
