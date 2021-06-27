CXX = gcc

all: f1 f2 main rezult staticlib rezultstatlib f1PIC f2PIC sharedlib rezultlibdyn

f1: f1.c
	$(CXX) -c f1.c

f2: f2.c
	$(CXX) -c f2.c

main: main.c
	$(CXX) -c main.c

rezult: f1.o f2.o main.o
	$(CXX) f1.o f2.o main.o -o rezult

staticlib: f1.o f2.o
	ar rc libfs.a f1.o f2.o
	ranlib libfs.a

rezultstatlib: libfs.a
	$(CXX) -static main.o -L. -lfs -o rezultstatlib

f1PIC: f1.c
	$(CXX) -fPIC -c f1.c -o f1PIC.o

f2PIC: f2.c
	$(CXX) -fPIC -c f2.c -o f2PIC.o

sharedlib: f1PIC.o f2PIC.o
	$(CXX) -shared -o libfsdyn.so f1PIC.o f2PIC.o

rezultlibdyn: main.o libfsdyn.so
	$(CXX) main.o -L. -lfsdyn -o rezultlibdyn

clean:
	rm -f *~
	rm -f *.o
	rm -f rezult
	rm -f rezultstatlib
	rm -f rezultlibdyn
	rm -f libfs.a
	rm -f libfsdyn.so
