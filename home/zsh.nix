{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "web-search"];
    };

    initContent = ''
      fastfetch
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
      bindkey '^ ' autosuggest-accept
      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
      source <(fzf --zsh)
      export PATH=$PATH:/usr/local/go/bin
      export PATH=/usr/local/cuda/bin:$PATH
      export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

      export ANDROID_HOME="$HOME/Android/Sdk"
      export ANDROID_SDK_ROOT="$ANDROID_HOME"
      export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH"
      
      export PATH="$PATH:$ANDROID_HOME/emulator"
      export PATH="$PATH:$ANDROID_HOME/platform-tools"
    '';

    shellAliases = {
      cls = "clear";
      hb = "home-manager switch --flake ~/nixos#dark";
      nb = "sudo nixos-rebuild switch --flake ~/nixos#dark";
      nx = "cd ~/nixos && nvim . && cd -";
      nv = "nvim";
      nivm = "nvim";
      cd = "z";
      sz = "source ~/.zshrc";
      nz = "nvim ~/.zshrc && sz";
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      lisa = ''nvim "output.txt" -c "vsplit main.cpp | wincmd l | split input.txt | wincmd h | vertical resize 120 | execute \"normal! 1GV24Gzf\""'';
    };

    history = {
      size =  10000;
    };
  };
}
