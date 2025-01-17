.PHONY: update
update:
	home-manager switch --flake .#bxg426

.PHONY: clean
clean:
	nix-collect-garbage -d
