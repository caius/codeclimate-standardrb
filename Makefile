.PHONY: image
image:
	docker build --rm --tag codeclimate/codeclimate-standardrb .
