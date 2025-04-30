{
  # Enable iwd as the wireless backend
  networking.wireless.iwd = {
    enable = true;
  };

  # Disable conflicting wireless services
  networking.wireless.enable = false; # Disable default wpa_supplicant
  networking.networkmanager.enable = false; # Disable NetworkManager if present

  # Ensure iwctl is available system-wide
  #environment.systemPackages = [ pkgs.iwctl ];

  # Create the iwd configuration file for the 802.1X network
  systemd.tmpfiles.rules = [
  "w /var/lib/iwd/eduroam.8021x - - - - [Security]\nEAP-Method=PEAP\nEAP-Identity=fa23-bcs-126@cuilahore.edu.pk\nEAP-PEAP-Phase2-Method=MSCHAPV2\nEAP-Password=${builtins.readFile /etc/nixos/secrets/eduroam_password}\n\n[Settings]\nAutoConnect=true"
  "w /var/lib/iwd/one.psk - - - - [Security]\nPassphrase=${builtins.readFile /etc/nixos/secrets/one_password}\n\n[Settings]\nAutoConnect=true"
  "w /var/lib/iwd/PTCL-BB.psk - - - - [Security]\nPassphrase=${builtins.readFile /etc/nixos/secrets/PTCL-BB_password}\n\n[Settings]\nAutoConnect=true"
];
}
