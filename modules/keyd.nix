# nix-config/modules/keyd.nix
{ config, lib, pkgs, ... }:

{
  # Enable the keyd service
  services.keyd = {
    enable = true;
    # Ensure the keyd package is available for the service
    package = pkgs.keyd;

    # Define the keyd configuration using a raw string.
    # This directly maps to the /etc/keyd/default.conf format.
    config = ''
      # /etc/keyd/default.conf managed by NixOS (via modules/keyd.nix)

      [ids]
      * # Apply to all keyboards

      [main]
      # Home row mods configuration:
      # Hold for modifier, Tap for character

      # Left Hand
      a = overload(leftmeta, a)      # Hold 'a' for Left Super/Win
      s = overload(leftalt, s)       # Hold 's' for Left Alt
      d = overload(leftshift, d)     # Hold 'd' for Left Shift
      f = overload(leftcontrol, f)   # Hold 'f' for Left Control

      # Right Hand
      # NOTE: ';' is represented as 'semicolon' in keyd config
      semicolon = overload(rightmeta, semicolon) # Hold ';' for Right Super/Win
      l = overload(rightalt, l)       # Hold 'l' for Right Alt
      k = overload(rightshift, k)     # Hold 'k' for Right Shift
      j = overload(rightcontrol, j)   # Hold 'j' for Right Control

      # You can adjust the global timeout for overload/layer mods here (milliseconds)
      # Default is 200ms. Lower values make tapping easier but holding harder.
      # timeout = 180

      # You can add other [layer] definitions or keyd settings below if needed.
    ''; # End of keyd config string
  };

  # Optional, but recommended: Add libinput quirk for palm rejection with keyd's virtual keyboard
  # See: https://github.com/rvaiya/keyd/issues/723
  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
    MatchName=keyd virtual keyboard
    AttrKeyboardIntegration=internal
  '';

  # Optional: Add keyd to system packages if you want easy access to `keyd -l` etc.
  # environment.systemPackages = [ pkgs.keyd ];
}
