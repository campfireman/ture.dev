dev:
	hugo server --buildDrafts

build:
	rm -rf ./public
	hugo

release: build
	./scripts/release.sh

upload: release
	gsutil -m rsync -d -r ./public gs://blog.ture.dev
	gsutil -m setmeta -h "Cache-Control:no-cache" gs://blog.ture.dev/**/*.html
	gsutil -m setmeta -h "Cache-Control:public, max-age=300, immutable" gs://blog.ture.dev/**/*.css
	gsutil -m setmeta -h "Cache-Control:public, max-age=144000, immutable" gs://blog.ture.dev/**/*.{avif,svg,woff2,ttf}

new-post post-name:
	./scripts/new.sh "{{post-name}}"
