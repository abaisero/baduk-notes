.PHONY: install clean doctor serve serve-production build

install:
	bundle install

clean:
	bundle exec jekyll clean

doctor:
	bundle exec jekyll doctor

serve: svgs
	bundle exec jekyll serve --livereload

serve-production: svgs
	JEKYLL_ENV=production bundle exec jekyll serve --livereload --baseurl ""

build: svgs
	bundle exec jekyll build

include svgs.makefile
