{ config, lib, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

      set -x ANDROID_HOME $HOME/Android/Sdk
      set -gx PATH $ANDROID_HOME/{platform_tools,tools,tools/bin,emulator} $PATH

      set -g theme_display_rw no
      set -g theme_display_group no
    '';
  };

  home.activation.setFishAsDefaultShell =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      readonly fish_bin_path="${config.home.homeDirectory}/.nix-profile/bin/fish";
      if ! grep -q "$fish_bin_path" "/etc/shells"; then
        sudo tee -a /etc/shells <<< "$fish_bin_path"
      fi
    '';
}
