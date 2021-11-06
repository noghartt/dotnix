{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";

    extraConfig = ''
      set-option -g default-shell ~/.nix-profile/bin/fish

      set-option -g -q mouse on
    '';
  };
}
