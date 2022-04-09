VAGRANT=vagrant



all: up status

up: ## up VM
	$(VAGRANT) up

stop: ## stop
	$(VAGRANT) halt

status: ## status
	$(VAGRANT) status	

restart: ## restart
	$(VAGRANT) reload

rebuild: ## rebuild
	$(VAGRANT) provision

delete: ## delete VM
	$(VAGRANT) destroy

detail: ## print info
	$(VAGRANT) global-status

help: ## display this help screen
	@grep -E '^[a-zA-Z/_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
