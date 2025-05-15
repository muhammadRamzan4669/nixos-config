# modules/ghostty.nix
{ pkgs, ... }: {
  home.packages = with pkgs; [ ghostty ];
  programs.ghostty = {
    enable = true;
    settings = {
    font-family = "JetBrainsMono NFM";	
      theme = "catppuccin-mocha";
      font-size = 24;
      confirm-close-surface = false;
      shell-integration-features = "no-cursor";
      cursor-style = "block";
      mouse-hide-while-typing = true;
      window-padding-x = 0;
      window-padding-y = 0;
      #background-opacity = 0.85;
      bold-is-bright = true;
    };
  };
}
