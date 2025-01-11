dev:
	hugo server --buildDrafts

build:
	rm -rf ./public
	hugo

upload: build
	gsutil -h "Cache-Control: public, max-age=3600" cp -r ./public/* gs://blog.ture.dev
