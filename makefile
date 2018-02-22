.PHONY: demo
all: build pari

build:
	mkdir -p build

pari:build/HashMap.o build/SomeKeyHash.o build/main.o
	g++ $^ -o pari

build/HashMap.o: src/HashMap.cpp src/HashMap.h src/HashNode.h src/SomeKeyHash.h
build/SomeKeyHash.o: src/SomeKeyHash.cpp src/SomeKeyHash.h
build/main.o: src/main.cpp src/HashMap.h src/HashNode.h src/SomeKeyHash.h

build/%.o:src/%.cpp
	g++ -c $< -o $@


clean:
	rm -f build/*.o
