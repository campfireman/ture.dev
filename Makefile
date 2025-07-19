dev:
	hugo server --buildDrafts

build:
	rm -rf ./public
	hugo

upload: build
	gsutil -m rsync -d -r ./public gs://blog.ture.dev
	gsutil -m setmeta -h "Cache-Control:no-cache" gs://blog.ture.dev/**/*.html
	gsutil -m setmeta -h "Cache-Control:public, max-age=144000, immutable" gs://blog.ture.dev/**/*.{css,png,jpg,svg,woff2,ttf}
