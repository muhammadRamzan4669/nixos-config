# nix-config/modules/keyd.nix
{ config, lib, pkgs, ... }:

{
  # Enable the keyd service
  services.keyd = {
    enable = true;
    package = pkgs.keyd;

    keyboards.default = {
      ids = [ "*" ]; # Apply to all keyboards
      settings = {
        main = {
          a = "overload(meta, a)";      # Hold 'a' for Super/Win
          s = "overload(alt, s)";       # Hold 's' for Alt
          d = "overload(shift, d)";     # Hold 'd' for Shift
          f = "overload(control, f)";   # Hold 'f' for Control
          semicolon = "overload(meta, semicolon)"; # Hold ';' for Super/Win
          l = "overload(alt, l)";       # Hold 'l' for Alt
          k = "overload(shift, k)";     # Hold 'k' for Shift
          j = "overload(control, j)";   # Hold 'j' for Control
        };
      };
      # Add timeout for overload mods (in milliseconds)
      extraConfig = ''
        timeout = 180
      '';
    };
  };

  # Optional: Libinput quirk for palm rejection with keyd's virtual keyboard
  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
    MatchName=keyd virtual keyboard
    AttrKeyboardIntegration=internal
  '';

  # Optional: Add keyd to system packages for CLI access
  # environment.systemPackages = [ pkgs.keyd ];
}
