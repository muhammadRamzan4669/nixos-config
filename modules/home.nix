# modules/home.nix
{ pkgs, ... }:
{
  home.username = "lynx";
  home.homeDirectory = "/home/lynx";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    git
    qutebrowser
    ripgrep
    lazygit
    fd
    gcc
    mpv
    nodejs_23
    unzip
  ];

  programs.git = {
    enable = true;
    userName = "LYNX";
    userEmail = "ramzanlynx@outlook.com";
  };
}
