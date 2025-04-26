# home.nix
{ imports = [
    ./modules/home.nix
    ./modules/hyprland.nix
    ./modules/zsh.nix
    ./modules/neovim.nix
    ./modules/ghostty.nix
    ./modules/qutebrowser.nix 
    ./modules/hyprpaper.nix 
  ];
}
