{ config, pkgs, ... }: 

{
  users.users.vikram_18 = {
    isNormalUser = true;
    description = "Sriman Vikram";
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers" "kvm" "input" "ydotool"];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  fonts = {
    packages = with pkgs; [
      font-awesome
      open-sans
      nerd-fonts.jetbrains-mono
      inter
    ];
  };

  environment.variables = {
    XCURSOR_THEME = "Posy_Cursor";
    XCURSOR_SIZE = "24";
  };
}

