# modules/home.nix
{ pkgs, ... }:
{
  home.username = "lynx";
  home.homeDirectory = "/home/lynx";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    git
    fastfetch
    vscodium
    qutebrowser
    ripgrep
    lazygit
    fd
    gcc
    mpv
    nodejs_23
    unzip
  ];

  programs.fastfetch.enable = true;
  programs.chromium.enable = true;
  programs.git = {
    enable = true;
    userName = "LYNX";
    userEmail = "ramzanlynx@outlook.com";
  };
}
