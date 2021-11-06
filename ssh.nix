{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes
    '';
  };

  systemd.user.services.ssh-agent = {
    Unit = { Description = "SSH Key Agent"; };

    Service = {
      Type = "simple";
      Environment = [
        "SSH_AUTH_SOCK=%t/ssh-agent.socket"
        "DISPLAY=:0"
      ];
      ExecStart = "${pkgs.openssh}/bin/ssh-agent -D -a $SSH_AUTH_SOCK";
    };

    Install = { WantedBy = [ "default.target" ]; };
  };
}
