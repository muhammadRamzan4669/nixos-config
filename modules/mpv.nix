{ config, pkgs, ... }:

{
  # Ensure mpv is installed
  environment.systemPackages = with pkgs; [ mpv ];

  # Define mpv configuration for the user
  home-manager.users.lynx = { pkgs, ... }: {
    home.packages = [ pkgs.mpv ]; # Optional, ensures mpv is available

    # Define input.conf to avoid conflicts (optional, if you want to preserve default bindings)
    xdg.configFile."mpv/input.conf".text = ''
      # Optionally unbind SPACE to avoid conflicts with default pause behavior
      # SPACE ignore
    '';

    # Add Lua script for spacebar hold to control playback speed
    xdg.configFile."mpv/scripts/speed_toggle.lua".text = ''
      local mp = require 'mp'

      -- Track if spacebar is held
      local space_held = false

      mp.register_event("key-down", function(event)
          if event.key_name == "SPACE" then
              if not space_held then
                  space_held = true
                  mp.set_property("speed", 2) -- Set speed to 2x
              end
          end
      end)

      mp.register_event("key-up", function(event)
          if event.key_name == "SPACE" then
              space_held = false
              mp.set_property("speed", 1) -- Reset speed to 1x
          end
      end)
    '';
  };
}
