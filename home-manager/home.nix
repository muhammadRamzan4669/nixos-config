{ pkgs, inputs, ... }: {
  imports = [
    ../modules/home-manager/hyprland.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/ghostty.nix
    ../modules/home-manager/qutebrowser.nix
    ../modules/home-manager/hyprpaper.nix
    ../modules/home-manager/nvf.nix
    inputs.stylix.homeModules.stylix
  ];

  home.username = "lynx";
  home.homeDirectory = "/home/lynx";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    git
    qutebrowser
    mpv
    nodejs_23
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

  # Stylix configuration
  stylix = {
    enable = true;
    image = ../wallpaper.jpg; # Adjusted path
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    opacity = {
      terminal = 0.85;
      applications = 1.0;
      popups = 1.0;
      desktop = 1.0;
    };
    targets = {
      hyprland.enable = true;
      zsh.enable = true;
      qutebrowser.enable = true;
    };
  };
}
