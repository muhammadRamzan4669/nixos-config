# nix-config/modules/hyprpaper.nix
{ pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "${../wallpaper.jpg}" ]; # Preload the wallpaper
      wallpaper = [ "eDP-1,${../wallpaper.jpg}" ]; # Assign to eDP-1 monitor
    };
  };
}
