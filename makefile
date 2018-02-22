.PHONY: demo
all: build pari

build:
	mkdir -p build

pari:build/HashMap.o build/SomeKeyHash.o build/main.o
	g++ $^ -o pari

-include build/*.d

build/%.o:src/%.cpp
	g++ -c $< -o $@ -MMD


clean:
	rm -f build/*.o build/*.d
