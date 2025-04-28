{
  # Enable iwd as the wireless backend
  networking.wireless.iwd = {
    enable = true;
  };

  # Disable conflicting wireless services
  networking.wireless.enable = false; # Disable default wpa_supplicant
  networking.networkmanager.enable = false; # Disable NetworkManager if present

  # Ensure iwctl is available system-wide
  environment.systemPackages = [ pkgs.iwctl ];

  # Create the iwd configuration file for the 802.1X network
  environment.etc."iwd/<SSID>.8021x" = {
    text = ''
      [Security]
      EAP-Method=PEAP
      EAP-Identity=fa23-bcs-126@cuilahore.edu.pk
      EAP-PEAP-Phase2-Method=MSCHAPV2
      EAP-Password=admin4669

      [Settings]
      AutoConnect=true
    '';
    mode = "0600"; # Secure permissions to protect the password
  };
}
