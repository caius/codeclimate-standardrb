IMAGE_NAME="codeclimate/codeclimate-standardrb"

.PHONY: all
all:
	@echo There is no all. Try help.

.PHONY: image
image: ## Build the image
	docker build --rm --force-rm --tag $(IMAGE_NAME) .

.PHONY: run
run: image ## Run the container against ./code
	docker run --rm --volume code:/code $(IMAGE_NAME)

.PHONY: help
help: ## Output help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
