BIN_DIR = ~/.local/bin

FILES = $(wildcard bin/*)
SRC_BIN = $(realpath bin)

.PHONY: install

install: $(FILES) ; @echo "success"

# the $* means to use what mached the "%"
$(FILES): bin/%: 
	[ ! -e $(BIN_DIR)/$* ] && ln -s $(SRC_BIN)/$* $(BIN_DIR)/$*
