.PHONY: build
build:
	bundle exec middleman build

.PHONY: run
run:
	bundle exec middleman server

.PHONY: deploy
deploy: build
	bundle exec middleman deploy

source/fingerprints.txt.sig: source/fingerprints.txt
	gpg --sign --local-user 'B79F 0840 DEF1 2EBB A72F  F72D 7327 A44C 2157 A758' --output source/fingerprints.txt.sig source/fingerprints.txt
