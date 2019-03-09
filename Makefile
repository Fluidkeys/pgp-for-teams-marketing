.PHONY: build
build:
	cd hugo ;\
	hugo

.PHONY: run
run:
	cd hugo ;\
	hugo server

.PHONY: test
test:
	make build
	@echo "OK"

.PHONY: deploy
deploy: build
	./deploy

source/fingerprints.txt.sig: source/fingerprints.txt
	gpg --sign --local-user 'B79F 0840 DEF1 2EBB A72F  F72D 7327 A44C 2157 A758' --output source/fingerprints.txt.sig source/fingerprints.txt

download_nginx_config:
	scp www.fluidkeys.com:/etc/nginx/sites-enabled/fluidkeys.com* _config/etc/nginx/sites-enabled/
	scp www.fluidkeys.com:/etc/nginx/sites-enabled/www.fluidkeys.com* _config/etc/nginx/sites-enabled/
	scp www.fluidkeys.com:/etc/nginx/sites-enabled/download.fluidkeys.com* _config/etc/nginx/sites-enabled/
