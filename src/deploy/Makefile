##
# aks-container
#
# @file
# @version 0.1
#
.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  create - Run create.sh"
	@echo "  bootstrap - Run bootstrap.sh"
	@echo "  connect - Run connect.sh"
	@echo "  stop - Run stop.sh"
	@echo "  destroy - Run destroy.sh"

create:
	sh login.sh
	sh create.sh
	sh connect.sh
	sh bootstrap.sh

create-cluster-only:
	sh login.sh
	sh create.sh

bootstrap:
	sh login.sh
	sh connect.sh
	sh bootstrap.sh

connect:
	sh login.sh
	sh connect.sh
	/bin/bash

stop:
	sh login.sh
	sh stop.sh

start:
	sh login.sh
	sh start.sh

destroy:
	sh login.sh
	sh destroy.sh

browse:
	sh login.sh
	sh connect.sh
	kubectl port-forward service/weave-gitops 9001:9001 -n flux-system && \
		echo " " && \
		echo "You can now browse the GitOps UI from your host at http://localhost:9001" && \
		echo "username: admin" && \
		echo "password: flux"

forward:
	sh login.sh
	sh connect.sh
	kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 8080:80 && \
		echo " " && \
		echo "You can now access the ingress at http://localhost:8080" && \
		echo "To verify run:" && \
		echo "curl -H "Host: podinfo.staging" http://localhost:8080"
# end
