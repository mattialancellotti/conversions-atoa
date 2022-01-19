SHELL = /bin/sh

# Programs used by this makefile
RM  = rm --recursive --verbose

prefix = $(HOME)/.local
bindir = $(prefix)/bin
srcdir = ./src

BINARY = rkconv

INSTALL_PROGRAM = install

$(BINARY): $(srcdir)/main.rkt
	raco exe -o $(BINARY) $^

.PHONY: all install uninstall clean
all: install clean

install: $(BINARY)
	@echo "Installing your binary to $(bindir)."
	$(INSTALL_PROGRAM) $(BINARY) $(bindir)
	@echo "Done."

uninstall:
	@echo "Uninstalling $(BINARY) from $(bindir)."
	$(RM) $(bindir)/$(BINARY)
	@echo "Done."

clean:
	$(RM) $(BINARY)
