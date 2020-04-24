This repo demonstrates a bug in gcc 9.2.0 compilation optimization

It uses a bunch of files from github.com/flatironinstitute/FMM3D to
demonstrate the issue

Onn running make, the script 
runs a test code using three different compile options:

1. `-O3 -march=native -fPIC -funroll-loops -fopenmp`
2. `-O3 -march=native -fPIC -funroll-loops -fdefault-integer-8 -finteger-4-integer-8 -fopenmp`
3. `-O3 -mavx2 -fPIC -funroll-loops -fdefault-integer-8 -finteger-4-integer-8 -fopenmp`

When using gcc/9.2.0 the last 10 lines of output should be:: 

   -O3 -march=native -fPIC -funroll-loops -fopenmp
  Successfully completed 5 out of 5 tests in helmrouts3d testing suite
   Failed mpmp test
   Failed mploc test
   Failed locloc test
   -O3 -march=native -fPIC -funroll-loops -fdefault-integer-8 -finteger-4-integer-8 -fopenmp
  Successfully completed 2 out of 5 tests in helmrouts3d testing suite
   -O3 -mavx2 -fPIC -funroll-loops -fdefault-integer-8 -finteger-4-integer-8 -fopenmp
  Successfully completed 5 out of 5 tests in helmrouts3d testing suite
  rm print_testres.txt

When using gcc/8.4.0 the last 7 lines of output should be:: 

   -O3 -march=native -fPIC -funroll-loops -fopenmp
  Successfully completed 5 out of 5 tests in helmrouts3d testing suite
   -O3 -march=native -fPIC -funroll-loops -fdefault-integer-8 -finteger-4-integer-8 -fopenmp
  Successfully completed 5 out of 5 tests in helmrouts3d testing suite
   -O3 -mavx2 -fPIC -funroll-loops -fdefault-integer-8 -finteger-4-integer-8 -fopenmp
  Successfully completed 5 out of 5 tests in helmrouts3d testing suite
  rm print_testres.txt
