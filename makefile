.PHONY: demo

pari:HashMap.o SomeKeyHash.o main.o
	g++ $^ -o pari

HashMap.o: src/HashMap.cpp src/HashMap.h src/HashNode.h src/SomeKeyHash.h
	g++ $< -c

SomeKeyHash.o: src/SomeKeyHash.cpp src/SomeKeyHash.h
	g++ $< -c

main.o: src/main.cpp src/HashMap.h src/HashNode.h src/SomeKeyHash.h
	g++ $< -c

clean:
	rm -f *.o
