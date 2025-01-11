dev:
	hugo server --buildDrafts

build:
	rm -rf ./public
	hugo

upload: build
	gsutil cp -r ./public/* gs://blog.ture.dev
