 #
 #
 #                       +++++++*             =-----------            -------                        
 #                      ++++++++**              -----------          ---------                       
 #                     ++++++++++**             =-----------       =-----------                      
 #                      ++++++++****              -----------     =----------=                       
 #                       +++++++*****              -----------=  =----------=                        
 #                        ++++++******              -----------==----------=                         
 #                         +++++*******              ----------------------                          
 #                          ++++********              ---------------=-===                           
 #                           +++*********              ----------========                            
 #              ++++++++++++++++*********************** -------=========                             
 #            *+++++++++++++++++************************ =-====-=======              ++*             
 #           +++++++++++++++++++************************* ==-=========              ++++*            
 #          ++++++++++++++++++++************************** ============            ++++++*           
 #         *++++++++++++++++++++****************************============          +++++++++          
 #                                                           ============       *+++++++++++         
 #                          ============                      ============     *+++++++++++          
 #                         ============                        ============   ++++++++++++           
 #                        ============                           =========== *+++++++++++            
 #                       ===========-                             ==========++++++++++++             
 #                      ============                               ======= +*++++++++++              
 #                     ============                                 ===== *****++++++*               
 # =---------====================                                    === **********++++++++++++++++  
 #-------------=================                                      = *************+++++++++++++++ 
 #----------------=============                                        ******************++++++++++++
 #--------------------======== *                                      **********************++++++++ 
 # ---------------------===== ***                                    *************************+++++  
 #              =----------= *****                                  ************                      Emily's NixOS Config 
 #             ------------ ********                               ***********                       
 #            ------------ **********                             ***********                        
 #           ------------ ***********+                           ***********                         
 #          ------------   ***********+                        ************                          
 #         ------------     ************                      ************                           
 #        ------------       ************                     ***********                            
 #         ---------=         ************==========================----------------------=          
 #          -------            ************ ======================------------------------           
 #           =----=             ************ =======================--------------------=            
 #            =--              +************* ======================--------------------             
 #                            +*************++ =====================-------------------              
 #                           +***********++++++              =======----=                            
 #                          +*********++++++++++              ======------                           
 #                         +*****+*++++++++++++++              ==-=--------                          
 #                        *****+++++++ +++++++++++              =-----------                         
 #                       ***+++++++++   +++++++++++              -=----------                        
 #                      *+++++++++++     +++++++++++*             ==----------                       
 #                     ++++++++++++       ++++++++++++             =-----------                      
 #                      ++++++++++         ++++++++++++             =---------                       
 #                       ++++++++           ++++++++++++             =-------                        



{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

   # Zsh 
   programs.zsh.enable = true;
   users.defaultUserShell = pkgs.zsh;

  # list of packages 
  environment.systemPackages = with pkgs; [
    vim
    hyprland
    git
   kitty  
   wofi
   starship
   nerdfonts
   zsh
   hyfetch
   waybar
   discord
   home-manager
   neovim
   gnumake
   wl-clipboard
   hyprshot
   gcc
   xwayland
   lazygit
   swww
   ];
    # Xorg
    services.xserver.enable = true;


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
];

   # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
      };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.headset = {
    isNormalUser = true;
    description = "headset";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  



  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
