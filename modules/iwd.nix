{
  networking.wireless.iwd = {
    enable = true;
    settings = {
      General = {
        EnableNetworkConfiguration = true;
      };
    };
    networks = {
      "<SSID>.8021x" = {
        Security = {
          EAP-Method = "PEAP";
          EAP-Identity = "fa23-bcs-126@cuilahore.edu.pk";
          EAP-PEAP-Phase2-Method = "MSCHAPV2";
          EAP-Password = "admin4669";
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };
  };
}
