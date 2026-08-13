{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./users.nix
      ./packages.nix
      ./docker.nix
      ./nvidia.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "btusb.enable_autosuspend=0" "ipv6.disable=1" ];
  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "dark"; 
  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;
  networking.firewall.checkReversePath = false;
  networking.firewall.allowedTCPPorts = [ 22 53 8081 19000 19001 8096 8920 5037 3000];
  networking.firewall.allowedUDPPorts = [ 22 53 67 68 19000 7359 1900 ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true; # Set to false for better security if using keys
      PermitRootLogin = "prohibit-password"; # Recommended: "yes", "without-password", or "no"
    };
  };

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.enableAllFirmware = true;

  services.ratbagd.enable = true;

  services.flatpak.enable = true;
  services.xserver.enable = true;

  # services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # media-session.enable = true;
    # AUDIO DUCKING
    wireplumber = {
      enable = true;
      # extraConfig."11-bluetooth-policy" = {
      #   "wireplumber.settings" = {
      #     "bluetooth.autoswitch-to-headset-profile" = false;
      #   };
      # };
    };

  };

  services.asusd.enable = true;

  services.libinput.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
