.PHONY: help build build-preview serve

help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build site with production settings and put deliverables in ./public
	hugo --minify

build-preview: ## Build site with drafts and future posts enabled
	hugo --buildDrafts --buildFuture

serve: ## Boot the development server.
	hugo server --ignoreCache --buildFuture
