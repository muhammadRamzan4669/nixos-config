{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules/caps2esc.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = ["amdgpu" "radeon"];
  networking.hostName = "nixos"; 

  #hardware.bluetooth.enable = true;
  #services.blueman.enable = true;
  networking.wireless.iwd.enable = true;
  #networking.wireless.enable = true;
  #networking.wireless.networks = {
  #  "one" = {
  #   psk = "husnain411934@";
  #  };

   # "eduroam" = {
   #   auth = ''
    #    key_mgmt=WPA-EAP
     #   eap=PEAP
      #  identity="fa23-bcs-126@cuilahore.edu.pk"
       # password="admin4669"
        #phase2="auth=MSCHAPV2"
        #anonymous_identity="cuilahore.edu.pk"
      #'';
    #};
  #};

  time.timeZone = "Asia/Karachi";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [intel-media-driver vaapiIntel libvdpau-va-gl];
    };

  users.users.lynx = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    packages = with pkgs; [
    ];
  };

  environment.systemPackages = with pkgs; [];

  system.stateVersion = "24.11";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

