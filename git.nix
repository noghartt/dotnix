{ config, ... }:

{
  programs.git = {
    enable = true;

    userName = "Guilherme Ananias";
    userEmail = "iamguilhermeananias@gmail.com";
    
    extraConfig = {
      init = { defaultBranch = "main"; };
      core = { editor = "vim"; };
    };
  };
}
