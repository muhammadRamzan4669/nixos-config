# modules/ghostty.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [ ghostty ];
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      font-size = 24;
      confirm-close-surface = false;
      cursor-style = "block";
      mouse-hide-while-typing = true;
      window-padding-x = 10;
      bold-is-bright = true;
    };
  };
}
