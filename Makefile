HERE = $(shell pwd)
BIN = $(HERE)/bin
PYTHON = $(BIN)/python
INSTALL = $(BIN)/pip install --no-deps
BUILD_DIRS = bin build include lib lib64 man share
VIRTUALENV = virtualenv

.PHONY: all test build 

all: build

$(PYTHON):
	$(VIRTUALENV) $(VTENV_OPTS) .

build: $(PYTHON)
	$(BIN)/pip install tox

clean:
	rm -rf $(BUILD_DIRS)

test: build
	$(BIN)/tox
