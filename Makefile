.PHONY: update
update:
	home-manager -b ".bak" switch  --flake .#brent

.PHONY: clean
clean:
	nix-collect-garbage -d
