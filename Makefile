.PHONY: all lint

all: lint

lint:
	@find . -name ".bash_profile" -o -name ".bashrc" -o -name "*.sh" -exec shellcheck {} \+
