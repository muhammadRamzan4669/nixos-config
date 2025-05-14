# home.nix
{ pkgs, ... }: {
  imports = [
    ./modules/hyprland.nix
    ./modules/zsh.nix
    ./modules/ghostty.nix
    ./modules/qutebrowser.nix 
    ./modules/hyprpaper.nix
  ];

  home.username = "lynx";
  home.homeDirectory = "/home/lynx";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    git
    qutebrowser
    #ripgrep
    #lazygit
    #fd
    #gcc
    mpv
    nodejs_23
    unzip
    aria2
    iwd
    vscodium
    neovim
    brave
  ];

  programs.zsh.enable = true;
 
  programs.git = {
    enable = true;
    userName = "LYNX";
    userEmail = "ramzanlynx@outlook.com";
  };
}
