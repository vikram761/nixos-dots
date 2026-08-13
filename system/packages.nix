{ config, pkgs, inputs, ... }:
let
  rose = pkgs.writeScriptBin "rose" (builtins.readFile ../scripts/rose);
in
{
  imports = [
    inputs.silentSDDM.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    home-manager

    rose

    gparted
    go-task
    fd
    ripgrep
    git
    wget
    xdg-utils
    grim
    awww
    slurp
    wlogout
    networkmanagerapplet
    blueman
    brightnessctl

    gcc
    clang
    clang-tools
    llvmPackages.libcxx

    pamixer
    zip
    unzip
    wl-clipboard

    mangohud
    protonup-qt
    heroic
    wineWow64Packages.stable

    proton-vpn
    openssl

    cudatoolkit

    posy-cursors
    piper
  ];

  programs.nix-ld = {
    enable = true;
    libraries =
      pkgs.steam-run.args.multiPkgs pkgs
      ++ (with pkgs; [
        libxkbfile
        stdenv.cc.cc.lib
        vulkan-loader
        libGL
      ]);
  };

  programs.silentSDDM = {
    enable = true;
    theme = "default";
  };

  programs.ydotool.enable = true;

  programs.steam.enable = true;

  programs.thunar.enable = true;

  programs.zsh.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

}
