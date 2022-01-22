all: aprox_chebyshev aprox_taylor

aprox_chebyshev: main.o splines.o points.o baza_czebyszew.o aproksymator.o gaus/libge.a
	$(CC) -o aprox_chebyshev main.o splines.o points.o baza_czebyszew.o aproksymator.o -L gaus -l ge

aprox_taylor: main.o splines.o points.o baza_taylor.o aproksymator.o gaus/libge.a
	$(CC) -o aprox_taylor main.o splines.o points.o baza_taylor.o aproksymator.o -L gaus -l ge

intrp: main.o splines.o points.o interpolator.o gaus/libge.a
	$(CC) -ggdb3 -o intrp  main.o splines.o points.o interpolator.o -L gaus -l ge

prosta: main.o splines.o points.o prosta.o
	$(CC) -ggdb3 -o prosta  main.o splines.o points.o prosta.o	

aproksymator.o: makespl.h points.h baza.h gaus/piv_ge_solver.h
	$(CC) -ggdb3 -I gaus -c aproksymator.c

interpolator.o: makespl.h points.h gaus/piv_ge_solver.h
	$(CC) -ggdb3 -I gaus -c interpolator.c

.PHONY: cleanexec cleanall

cleanexec:
	-rm *.o aprox_chebyshev aprox_taylor intrp prosta
cleanall:
	rm -f *.o aprox_chebyshev aprox_taylor intrp prosta main.o splines.o baza_czebyszew.o baza_taylor.o points.o splines.o prosta.o interpolator.o aproksymator.o
