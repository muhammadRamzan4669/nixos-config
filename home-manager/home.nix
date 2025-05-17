{ pkgs, inputs, ... }: {
  imports = [
    ../modules/home-manager/hyprland.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/ghostty.nix
    ../modules/home-manager/qutebrowser.nix
    ../modules/home-manager/hyprpaper.nix
    ../modules/home-manager/nvf.nix
  ];

  home.username = "lynx";
  home.homeDirectory = "/home/lynx";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    git
    qutebrowser
    mpv
    nodejs
    unzip
    aria2
    iwd
    vscodium
    neovim
    brave
    jq
  ];

  programs.git = {
    enable = true;
    userName = "LYNX";
    userEmail = "ramzanlynx@outlook.com";
  };
}
