# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  } ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zephyrus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enabling hyprland
  programs.hyprland.enable = true;

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
    packages = with pkgs; [ 
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland       # xdg backend for Hyprland
    asusctl                           # interacting with Asus ROG laptops
    libnotify                         # notification library
    sxhkd                             # x hotkey daemon for berry
    arandr                            # managing monitor placement for xserver
    pavucontrol                       # pulse audio controller
    qt6.qtwayland                     # application framework
    libsForQt5.qt5.qtwayland          # ^
    foot                              # terminal emulator
    sakura                            # ^
    btop                              # system monitor
    tmux                              # terminal multiplexer
    screen                            # ^
    tldr                              # simplified man pages for quick reference
    firefox                           # web browser
    qutebrowser                       # ^
    browsh                            # ^
    lynx                              # ^
    vim                               # text editor
    emacs                             # ^
    helix                             # ^
    kakoune                           # ^
    geany                             # ^
    vscode                            # ^
    bat                               # code pager
    libreoffice                       # free office quite
    texmacs                           # scientific document editor
    xournal                           # pdf annotation software
    git                               # version control
    elvish                            # shell
    tofi                              # app launcher
    swaybg                            # wallpaper setter
    waybar                            # status bar
    mako                              # notification daemon
    grim                              # screenshot
    slurp                             # screen area selector
    zathura                           # document viewer
    mpv                               # video player
    imv                               # image viewer
    xchm                              # chm viewer
    neofetch                          # system fetch
    yt-dlp                            # youtube video downloader
    brightnessctl                     # change brightness
    wl-clipboard                      # managing clipboard content
    p7zip                             # extracting and zipping in 7z format
    ffmpeg                            # for editing video and audio
    pandoc                            # change file format
    haskellPackages.pandoc-plot_1_8_0 # plotting filter for pandoc
    graphviz-nox                      # graph generator
    poppler_utils                     # pdf rendering library
    networkmanagerapplet              # network manager tray applet
    sshfs                             # ssh file system
    translate-shell                   # cli translator
    tty-clock                         # tty clock
    calc                              # calculator
    texlive.combined.scheme-full      # latex packages
    racket                            # racket programming language
    ghc                               # haskell compiler
    haskell-language-server           # haskell language server
    gcc                               # C/C++ compiler
    llvmPackages_9.clang-unwrapped    # C/C++ language server
    lldb                              # C/C++ debugger
    gdb                               # ^
    ncurses                           # C tui builder
    valgrind                          # C memory leak detecter
    python3                           # python3 programming language
    gnumake                           # gnumake builder
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
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
