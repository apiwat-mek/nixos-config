{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/common.nix
      ../../modules/hypr.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  networking.hostName = "nix-btw"; # Define your hostname.

  networking.networkmanager.enable = true;

  services.auto-cpufreq.enable = true;

  system.stateVersion = "26.05"; # Did you read the comment?

}
