# nix-config/modules/hyprpaper.nix
{ pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      wallpapers = [
        ",${./wallpaper.jpg}" # Reference the wallpaper in nix-config
      ];
    };
  };
}
