{ config, lib, pkgs, thorium, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # boot.loader.systemd-boot = {
  #   enable = true;
  #   configurationLimit = 2;
  # };

  # boot.loader.efi.canTouchEfiVariables = true;
boot.loader = {
  efi.canTouchEfiVariables = true;
  systemd-boot.enable = false;   # disable the old one

  limine = {
    enable = true;
    secureBoot.enable = true;

    # Optional but recommended
    maxGenerations = 2;
    # timeout = 5;               # seconds before auto-boot
  };
};

boot.loader.limine.extraEntries = ''
/Windows 11
protocol: efi
path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
'';

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Karachi";

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.libinput.enable = true;

  services.interception-tools = {
    enable = true;
    plugins = with pkgs.interception-tools-plugins; [
      caps2esc
    ];
    udevmonConfig = ''
      - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${
        pkgs.interception-tools-plugins.caps2esc
      }/bin/caps2esc | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.highlighters = [ "main" ];
    autosuggestions.enable = true;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    xinit
    xrandr
    brightnessctl
    alsa-utils
    sbctl
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  users.users.lynx = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "video" ];
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];

    substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];

    # access-tokens = [ ];   # only keep if you actually use it
  };

  system.stateVersion = "26.05";
}
