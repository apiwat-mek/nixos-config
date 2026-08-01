{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    waybar
    swaybg
    swaynotificationcenter
    rofi
    thunar

    wl-clipboard
    cliphist
    wl-clip-persist
  ];
}
