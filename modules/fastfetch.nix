# modules/fastfetch.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [ fastfetch ];
  programs.fastfetch = {
    enable = true;
    settings = {
      # Logo configuration
      logo = {
        type = "auto"; # Automatically uses the distro’s logo
        padding = {
          top = 2;
          left = 2;
        };
      };

      # Display configuration
      display = {
        separator = ": "; # Simple colon separator for a clean look
        key.width = 12; # Aligns labels to a fixed width
      };

      # Modules configuration
      modules = [
        "break" # Spacing above the fetch output
        {
          type = "title"; # Username@hostname
          key = "User ";
          key.color = "36"; # Cyan for the title
        }
        "break"
        {
          type = "os";
          key = "OS   ";
          key.color = "34"; # Blue for system-related fields
        }
        {
          type = "kernel";
          key = " ├  ";
          key.color = "34";
        }
        {
          type = "packages";
          format = "{} (pacman)"; # Adjust based on your package manager
          key = " ├ 󰏖 ";
          key.color = "34";
        }
        {
          type = "shell";
          key = " └  ";
          key.color = "34";
        }
        "break"
        {
          type = "wm";
          key = "WM   ";
          keyColor = "32"; # Green for desktop-related fields
        }
        {
          type = "wmtheme";
          key = " ├ 󰉼 ";
          keyColor = "32";
        }
        {
          type = "terminal";
          key = " ├  ";
          keyColor = "32";
        }
        {
          type = "terminalfont";
          key = " └  ";
          keyColor = "32";
        }
        "break"
        {
          type = "cpu";
          format = "{1} @ {7} GHz";
          key = "CPU  ";
          keyColor = "33"; # Yellow for hardware-related fields
        }
        {
          type = "gpu";
          format = "{1} {2}";
          key = " ├ 󰢮 ";
          keyColor = "33";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "33";
        }
        "break"
        {
          type = "colors";
          key = "Colors ";
          keyColor = "36"; # Cyan for the color blocks
          symbols = "square"; # Square color blocks
        }
        "break"
      ];
    };
  };
}
