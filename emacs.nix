{ config, pkgs, lib, ... }:

let
  inherit (config.home) homeDirectory;
in
{
  home.packages = with pkgs; [
    fd
    ripgrep
    clang
    coreutils

    texlive.combined.scheme-medium
  ];

  home.sessionPath = [ "${homeDirectory}/.config/emacs/bin" ];

  programs.emacs.enable = true;

  home.activation = {
    installDoom = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      readonly emacs_dir="${homeDirectory}/.config/emacs";
      [ ! -d "$emacs_dir" ] && \
        $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 https://github.com/hlissner/doom-emacs "$emacs_dir"
    '';
  };
}
