GO ?= go
GOFMT ?= gofmt "-s"
DOCKER ?= docker
OPENAPI_GENERATOR ?= 'openapitools/openapi-generator-cli:v3.3.4'
OPENAPI_ROOT_FILE ?= local/openapi.yaml
OPENAPI_SERVER_TYPE ?= go-gin-server
OPENAPI_DIST_DIR ?= openapi
PWD ?= $(shell pwd)
PACKAGES ?= $(shell $(GO) list ./...)
GOFILES ?= $(shell find . -name "*.go")
MAINFILE ?= main.go
DISTDIR ?= dist
OUTFILE ?= goremoch



.PHONY: fmt
fmt:
	$(GOFMT) -w $(GOFILES)

.PHONY: run
run:
	$(GO) run $(MAINFILE)

.PHONY: clean
clean:
	rm -f $(DISTDIR)/$(OUTFILE)

.PHONY: build
build:
	$(GO) build -o $(DISTDIR)/$(OUTFILE)

.PHONY: openapi
openapi:
	${DOCKER} run -v $(PWD):/local $(OPENAPI_GENERATOR) generate -i $(OPENAPI_ROOT_FILE) -g $(OPENAPI_SERVER_TYPE) -o local/$(OPENAPI_DIST_DIR)
