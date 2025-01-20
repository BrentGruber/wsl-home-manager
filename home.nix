{ lib, pkgs, ... }: let
  username = "brent";
in {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
    	zsh-powerlevel10k
	meslo-lgs-nf
	ripgrep
	gcc
    ];

    sessionVariables = {
    	FLAKE = "$HOME/src/nix-config";
	SHELL = "zsh";
	MANPAGER = "batman";
     };

     stateVersion = "23.11";
};

  imports = [
    ./bat
    ./zsh
    ./eza
    ./nvim
  ];
}
