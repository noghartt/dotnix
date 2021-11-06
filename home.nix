{ config, pkgs, lib, ... }:

{
  imports = [
    ./emacs.nix
    ./fish.nix
    ./git.nix
    ./ssh.nix
    ./vscode.nix
    ./tmux.nix
  ];

  targets.genericLinux.enable = true;

  programs.home-manager.enable = true;

  home.username = "guilherme";
  home.homeDirectory = "/home/guilherme";

  home.stateVersion = "21.05";

  home.packages = with pkgs; [
    htop
    xclip
    gh
  ];
}
