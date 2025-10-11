{ config, lib, pkgs, ... }:

{
  imports = [
    # Hardware scan (auto generated)
    ./hardware-configuration.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # GRUB boot loader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      # efiInstallAsRemovable = true;
      device = "nodev";
    };
  };

  # Host settings
  networking = let
    hostName = "Shetty-Laptop";
  in {
    inherit hostName;
    extraHosts = ''
      127.0.0.1 localhost
      ::1 localhost
      127.0.0.1 ${hostName}.local
    '';
    networkmanager.enable = true; # Wifi tools

    # Proxy
    # proxy.default = "http://127.0.0.1:7890/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Internationalisation properties
  time.timeZone = "Asia/Taipei";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
      "zh_TW.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  };
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   # useXkbConfig = true; # use xkb.options in tty.
  # };

  # Global packages
  environment.systemPackages = with pkgs; [
    neovim
    bat

    # Driver
    asusctl
  ];
  environment.variables = {
    EDITOR = "nvim";
    PAGER = "bat";
  };

  services = {
    # Wayland windowing system
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # Keyring
    gnome.gnome-keyring.enable = true;

    # ASUS driver
    asusd.enable = true;

    # Sound
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # Nvidia
  nixpkgs.config = {
    nvidia.acceptLicense = true;
    cudaSupport = true;
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "nvidia-x11"
      ];
  };
  services.xserver.videoDrivers = [ "nvidia" ]; # Must have
  boot.kernelParams = lib.optionals (lib.elem "nvidia" config.services.xserver.videoDrivers) [
    "nvidia-drm.modeset=1"
    "nvidia_drm.fbdev=1"
  ];
  hardware = {
    nvidia = {
      open = false;
      nvidiaSettings = false;
      powerManagement.enable = true;
      modesetting.enable = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
          offloadCmdMainProgram = "prime-run";
        };
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     tree
  #   ];
  # };

  # Users
  users.users.shetty = {
    isNormalUser = true;
    description = "Shetty Yttehs";
    extraGroups = [
      "wheel" # Sudoers
    ];
    shell = pkgs.zsh;
  };

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    clash-verge = {
      enable = true;
      autoStart = true;
    };
  };

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

