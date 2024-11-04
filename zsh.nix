{ pkgs, ... }:

{


  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      vim = "nvim";
      hm = "home-manager --file ~/nix/home.nix";
    };
    

    # Add Starship initialization
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };
}

