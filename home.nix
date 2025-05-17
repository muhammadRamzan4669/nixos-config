{ pkgs, inputs, ... }: {
  imports = [
    ./modules/hyprland.nix
    ./modules/zsh.nix
    ./modules/ghostty.nix
    ./modules/qutebrowser.nix
    ./modules/hyprpaper.nix
    ./modules/nvf.nix
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
    foliate
  ];

  programs.zsh.enable = true;

  programs.git = {
    enable = true;
    userName = "LYNX";
    userEmail = "ramzanlynx@outlook.com";
  };

  # Stylix configuration
  stylix = {
    enable = true;
    image = ./wallpaper.jpg; # Use the same wallpaper as hyprpaper
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml"; # Match your ghostty theme
    polarity = "dark"; # or "light" depending on your preference
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
      terminal = 0.85; # Match your commented-out ghostty background-opacity
      applications = 1.0;
      popups = 1.0;
      desktop = 1.0;
    };
    targets = {
      hyprland.enable = true; # Theme Hyprland
      zsh.enable = true; # Theme ZSH/Powerlevel10k
      qutebrowser.enable = true; # Theme qutebrowser
    };
  };
}
