{inputs, config, pkgs, ...}:

{
    nixpkgs.config.allowUnfree = true;
    home.username = "vikram_18";
    home.homeDirectory = "/home/vikram_18";
    home.stateVersion = "25.05";

    home.packages = with pkgs; [
      inputs.hypr-annotate.packages.${pkgs.stdenv.hostPlatform.system}.default
      firefox
      rclone
      asusctl
      python311
      claude-code
      qbittorrent
      swappy
      fastfetch
      rustup
      kitty
      postman
      vim-full
      fzf
      brave
      wofi
      cliphist
      clipse
      zoxide
      btop
      pavucontrol
      killall
      go
      luarocks
      nodejs_22
      libreoffice
      yarn
      pnpm
      bun
      dconf
      jq
      swaynotificationcenter
      
      lua-language-server
      typescript-language-server
      tailwindcss-language-server
      gopls
      pyright
      clang-tools
      nixfmt
      shfmt
      stylua
      black
      isort

      gcc
      gnumake
      tree-sitter

      yazi
      zoom-us
      unrar
      ngrok
      hyprcursor
      windows10-icons
      zed-editor
      
      qogir-theme
      ollama-cuda

      libinput
      libinput-gestures
    ];

    programs.starship.enable = true;

    imports = [ ./zsh.nix ];
    
    gtk = {
      enable = true;
    };

    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Posy_Cursor";
      package = pkgs.posy-cursors;
      size = 24;
    };

    home.file.".local/share/sounds/freedesktop/stereo" = {
      source = ./sounds;
      recursive = true;
    };
    
    home.file.".config" = {
      source = ./dots;
      recursive = true;
    };

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      withRuby = false;
      withPython3 = false;
    };

    dconf.enable = true;
}

