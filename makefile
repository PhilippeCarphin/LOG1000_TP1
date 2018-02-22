SRC = $(wildcard src/*.cpp)
OBJ = $(subst src,build,$(SRC:.cpp=.o))
TRG = exec/pari.out
INSTALL_DIR = install_dir
INSTALL_NAME = pari

CXXFLAGS = -Werror=all -MMD

.PHONY: demo
all: build exec $(TRG)

build:
	mkdir -p $@
exec:
	mkdir -p $@

$(INSTALL_DIR):
	mkdir -p $@

install:$(INSTALL_DIR) all
	cp $(TRG) $(INSTALL_DIR)/$(INSTALL_NAME)

uninstall:
	rm -f $(INSTALL_DIR)/$(INSTALL_NAME)
	rmdir $(INSTALL_DIR)

test:$(TRG)
	./$(TRG) ./data/quantum_algo.txt

$(TRG):$(OBJ)
	g++ $^ -o $@

-include build/*.d

build/%.o:src/%.cpp
	g++ -c $< -o $@ $(CXXFLAGS)

vars:
	@echo "SRC = $(SRC)"
	@echo "OBJ = $(OBJ)"

clean:
	rm -f build/*.o build/*.d exec/*

mrproper:clean
	rmdir build exec
