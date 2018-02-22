SRC = $(wildcard src/*.cpp)
OBJ = $(subst src,build,$(SRC:.cpp=.o))
TRG = exec/pari

CXXFLAGS = -Werror=all -MMD

.PHONY: demo
all: build exec $(TRG)

build:
	mkdir -p build
exec:
	mkdir -p exec

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
	rm -f build/*.o build/*.d
