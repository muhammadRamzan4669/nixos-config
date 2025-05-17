{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "${../../wallpaper.jpg}" ];
      wallpaper = [ "eDP-1,${../../wallpaper.jpg}" ];
    };
  };
}
