SRC = $(wildcard src/*.cpp)
OBJ = $(subst src,build,$(SRC:.cpp=.o))

.PHONY: demo
all: build pari

build:
	mkdir -p build

pari:$(OBJ)
	g++ $^ -o pari

-include build/*.d

build/%.o:src/%.cpp
	g++ -c $< -o $@ -MMD

vars:
	@echo "SRC = $(SRC)"
	@echo "OBJ = $(OBJ)"

clean:
	rm -f build/*.o build/*.d
