.PHONY: all
.PHONY: clean

all: main

main: src-gen/DefaultSM.o main.o
	gcc -o main src-gen/DefaultSM.o main.o

clean:
	rm -rf src src-gen *.o main

main.o: main.c
	gcc -Wall -c main.c

src-gen/DefaultSM.o: src-gen/DefaultSM.c
	gcc -Wall -c src-gen/DefaultSM.c -o src-gen/DefaultSM.o

src-gen/DefaultSM.c: defaultSM.sct defaultSM.sgen
	scc
