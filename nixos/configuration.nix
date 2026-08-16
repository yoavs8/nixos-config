{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ------------------------------------------------------------
  # Nix
  # ------------------------------------------------------------

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow proprietary packages such as Steam and Discord
  nixpkgs.config.allowUnfree = true;


  # ------------------------------------------------------------
  # Bootloader
  # ------------------------------------------------------------

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;


  # ------------------------------------------------------------
  # Networking
  # ------------------------------------------------------------

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


  # ------------------------------------------------------------
  # Locale / Time
  # ------------------------------------------------------------

  time.timeZone = "Asia/Jerusalem";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  console.keyMap = "us";


  # ------------------------------------------------------------
  # User
  # ------------------------------------------------------------

  users.users.yoavs = {
    isNormalUser = true;
    description = "yoavs";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    shell = pkgs.zsh;

    packages = with pkgs; [
    ];
  };


  # ------------------------------------------------------------
  # Fonts
  # ------------------------------------------------------------

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];


  # ------------------------------------------------------------
  # Niri
  # ------------------------------------------------------------

  programs.niri.enable = true;


  # ------------------------------------------------------------
  # Browser
  # ------------------------------------------------------------

  programs.firefox.enable = true;


  # ------------------------------------------------------------
  # Flatpak
  # Used for Zen Browser
  # ------------------------------------------------------------

  services.flatpak.enable = true;


  # ------------------------------------------------------------
  # Zsh
  # ------------------------------------------------------------

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };


  # ------------------------------------------------------------
  # Games
  # ------------------------------------------------------------
  hardware.graphics = {
  enable = true;
  enable32Bit = true;
  };
  programs.steam = {
    enable = true;
  };
  programs.gamemode.enable = true;
  
  
  # ------------------------------------------------------------
  # Laptop / system essentials
  # ------------------------------------------------------------

  # Firmware updates
  services.fwupd.enable = true;

  # Laptop power profiles
  services.power-profiles-daemon.enable = true;

  # Compressed RAM swap
  zramSwap.enable = true;

  # Removable drives / USB mounting
  services.udisks2.enable = true;
 
  # ------------------------------------------------------------
  # System packages
  # ------------------------------------------------------------
  
  environment.systemPackages = with pkgs; [

    # Terminal / launcher / files
    kitty
    fuzzel
    kdePackages.dolphin

    # Niri / Wayland
    xwayland-satellite
    waybar
    mako
    swaybg
    swaylock
    swayidle

    # Development
    vscode.fhs
    git
    unzip
    tmux
    wget
    
    # System information
    fastfetch
    btop 

    # Communication
    discord-ptb

    # Clipboard / media / laptop controls
    wl-clipboard
    cliphist
    playerctl
    brightnessctl
    pavucontrol
  ];


  # ------------------------------------------------------------
  # NixOS version
  # DO NOT change this just because NixOS gets updated
  # ------------------------------------------------------------

  system.stateVersion = "26.05";
}
