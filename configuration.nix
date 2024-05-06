#                   __ _                       _   _                     _
#   ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __    _ __ (_)_  __
#  / __/ _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \  | '_ \| \ \/ /
# | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | |_| | | | |>  < 
#  \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_(_)_| |_|_/_/\_\
#                        |___/
#

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  } ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname.
  networking.hostName = "zephyrus";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enabling sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Configure X11
  services.xserver = {
      enable = true;
      windowManager.cwm.enable = true;
      xkb = {
          layout = "us";
          variant = "";
      };
      displayManager.startx.enable = true;
  };

  # fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    nerdfonts
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.arnavk = {
    isNormalUser = true;
    description = "Arnav Kumar";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
      asusctl slop figlet btop boxes tldr firefox qutebrowser lynx dmenu wmutils-core
      kitty kakoune bat pipe-rename texmacs git xclip fzy zathura mpv sxiv neofetch
      yt-dlp brightnessctl p7zip unzip ffmpeg pandoc graphviz-nox poppler_utils tty-clock
      texlive.combined.scheme-full racket ghc haskell-language-server R tinycc gcc lldb
      gdb ncurses valgrind python3 gnumake scrot arandr
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # for auto-cpufreq
  # services.auto-cpufreq.enable = true;

  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;

  # For Asusctl
  services.asusd.enable = true;
  services.asusd.enableUserService = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
