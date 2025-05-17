{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos/caps2esc.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = ["amdgpu" "radeon"];
  networking.hostName = "nixos";

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  networking.wireless.iwd.enable = true;

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
    packages = with pkgs; [];
  };

  services.timesyncd.enable = true;

  environment.systemPackages = with pkgs; [];

  system.stateVersion = "24.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
