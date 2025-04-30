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
      exportConfiguration = true;
      xkb = {
          layout = "us,ru";
          options = "compose:caps,grp:alt_caps_toggle";
      };
      displayManager.startx.enable = true;
  };

  services.libinput.touchpad.naturalScrolling = true;

  # fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
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
      asusctl slop figlet btop boxes tldr firefox lynx dmenu kitty kakoune # blender
      bat pipe-rename texmacs git xclip mpv sxiv fastfetch unp yt-dlp brightnessctl p7zip
      unzip ffmpeg pandoc graphviz-nox poppler_utils texlive.combined.scheme-full
      tty-clock racket ghc haskell-language-server R tinycc gcc lldb gdb ncurses valgrind
      python3 gnumake scrot arandr haskellPackages.pandoc-plot pwgen entr termdown sage
      godot_4 aseprite pulsemixer discord mitscheme starship translate-shell openconnect
      xournal i3 i3status clojure aria2 pup julia xorg.xev jupyter zip tree mupdf
      man-pages man-pages-posix obs-studio kdenlive
  ];

  documentation.dev.enable = true;

  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;

  services.asusd.enable = true;
  services.asusd.enableUserService = true;

  system.stateVersion = "23.05";
}
