{ config, pkgs, thorium, ... }:

{
  home.username = "lynx";
  home.homeDirectory = "/home/lynx";
  home.stateVersion = "26.05";

  programs.git = {
    enable = true;
    settings.user.name = "lynx";
    settings.user.email = "lynx4669@proton.me";
  };

  home.packages = with pkgs; [
    neovim
    alacritty
    dmenu
    tmux
    opencode
    picom
    (dwm.overrideAttrs { src = ./dwm; })
    thorium.thorium-avx2
  ];

  home.file.".zshrc" = {
    text = ''
    '';
  };

  home.file.".xinitrc" = {
    text = ''
      #!/bin/sh
      pkill picom

      if xrandr | grep -q "HDMI-1 connected"; then
        xrandr --output eDP-1 --off --output HDMI-1 --mode 1920x1080 --rate 75 --primary
      fi

      picom -b --backend glx --vsync &
      exec dwm
    '';
    executable = true;
  };
}
