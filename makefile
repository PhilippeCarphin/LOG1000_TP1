SRC = $(wildcard src/*.cpp)
OBJ = $(subst src,build,$(SRC:.cpp=.o))
TRG = exec/pari

.PHONY: demo
all: build exec $(TRG)

build:
	mkdir -p build
exec:
	mkdir -p exec

$(TRG):$(OBJ)
	g++ $^ -o $@

-include build/*.d

build/%.o:src/%.cpp
	g++ -c $< -o $@ -MMD

vars:
	@echo "SRC = $(SRC)"
	@echo "OBJ = $(OBJ)"

clean:
	rm -f build/*.o build/*.d
