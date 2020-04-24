
FC = gfortran
FFLAGS1 = -O3 -march=native -fPIC -funroll-loops -fopenmp
FFLAGS2 = -O3 -march=native -fPIC -funroll-loops -fdefault-integer-8 -finteger-4-integer-8 -fopenmp
FFLAGS3 = -O3 -march=native -fPIC -funroll-loops -fdefault-integer-8 -finteger-4-integer-8 -fopenmp

default: test

test:
	./mload.sh
	rm -f src/*.o
	rm -f int2
	make -f makefile1 -j
	make -f makefile2 -j
	make -f makefile3 -j
	cat print_testres.txt
	rm print_testres.txt
