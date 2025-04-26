# home.nix
{ pkgs, ... }:
{
  imports = [
    ./modules/hyprland.nix
    ./modules/zsh.nix
    ./modules/neovim.nix
    ./modules/ghostty.nix
    ./modules/qutebrowser.nix 
    ./modules/hyprpaper.nix 
  ];

  home.username = "lynx";
  home.homeDirectory = "/home/lynx";
  home.stateVersion = "24.11"; # Consider updating to "24.11" or your current system stateVersion

  home.packages = with pkgs; [
    git
    qutebrowser
    ripgrep
    lazygit
    fd
    gcc
    mpv
    nodejs_23 # Consider using a more stable LTS version unless 23 is needed
    unzip
  ];

  programs.git = {
    enable = true;
    userName = "LYNX";
    userEmail = "ramzanlynx@outlook.com";
  };
}
