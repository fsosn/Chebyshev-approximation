all: aprox_chebyshev aprox_taylor intrp prosta

aprox_chebyshev: main.o splines.o points.o baza_czebyszew.o aproksymator.o gaus/libge.a
	$(CC) -Wall -Wextra -pedantic -ggdb3 -o aprox_chebyshev main.o splines.o points.o baza_czebyszew.o aproksymator.o -L gaus -l ge

aprox_taylor: main.o splines.o points.o baza_taylor.o aproksymator.o gaus/libge.a
	$(CC) -Wall -Wextra -Werror -pedantic -ggdb3 -o aprox_taylor main.o splines.o points.o baza_taylor.o aproksymator.o -L gaus -l ge

intrp: main.o splines.o points.o interpolator.o gaus/libge.a
	$(CC) -Wall -Wextra -Werror -pedantic -ggdb3 -o intrp  main.o splines.o points.o interpolator.o -L gaus -l ge

prosta: main.o splines.o points.o prosta.o
	$(CC) -Wall -Wextra -Werror -pedantic -ggdb3 -o prosta  main.o splines.o points.o prosta.o	

aproksymator.o: makespl.h points.h baza.h gaus/piv_ge_solver.h
	$(CC) -Wall -Wextra -Werror -pedantic -ggdb3 -I gaus -c aproksymator.c

interpolator.o: makespl.h points.h gaus/piv_ge_solver.h
	$(CC) -Wall -Wextra -Werror -pedantic -ggdb3 -I gaus -c interpolator.c

.PHONY: clean

clean:
	-rm *.o aprox_chebyshev aprox_taylor intrp prosta
