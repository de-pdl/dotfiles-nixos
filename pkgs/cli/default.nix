{ config, pkgs, lib, ... }:

{
  # example: put your dotfiles & CLI tools into systemPackages
  environment.systemPackages = with pkgs; [
    git vim tmux
  ];

  # and maybe Home Manager:
  programs.bash.enable = true;
  programs.zsh.enable  = true;
  # …etc
}
