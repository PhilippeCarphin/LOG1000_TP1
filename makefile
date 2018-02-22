.PHONY: demo

pari:HashMap.o SomeKeyHash.o main.o
	g++ $^ -o pari

HashMap.o:src/HashMap.cpp
	g++ $< -c

SomeKeyHash.o:src/SomeKeyHash.cpp
	g++ $< -c

main.o:src/main.cpp
	g++ $< -c

clean:
	rm -f *.o
