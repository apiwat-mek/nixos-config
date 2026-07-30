{ config, pkgs, lib, inputs, ... }:

{

  time.timeZone = "Asia/Bangkok";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.displayManager.ly.enable = true;

  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users.mek = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  programs.firefox.enable = true;
  programs.nix-ld.enable = true;
  programs.fish = {
    enable = true;
    shellAliases = {
      nsw = "sudo nixos-rebuild switch --flake ~/nixos-dotfile";
      rollback = "sudo nixos-rebuild --rollback";
    };
  };

  environment.systemPackages = with pkgs; [
    tree
    gcc
    gnumake
    tree-sitter
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    fastfetch
    fetch
    wget
    git
    kitty
    lazygit
    btop
    pavucontrol
    inputs.helium.packages.${system}.default
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-cjk-sans
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Iosevka Nerd Font" ];
      sansSerif = [ "Noto Sans Thai" ];
      serif = [ "Noto Sans Thai" ];
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
};
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

}
