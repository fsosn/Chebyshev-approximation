aprox: main.o splines.o points.o baza_czebyszew.o aproksymator.o gaus/libge.a
	$(CC) -o aprox  main.o splines.o points.o baza_czebyszew.o aproksymator.o -L gaus -l ge

intrp: main.o splines.o points.o interpolator.o gaus/libge.a
	$(CC) -o intrp  main.o splines.o points.o interpolator.o -L gaus -l ge

prosta: main.o splines.o points.o prosta.o
	$(CC) -o prosta  main.o splines.o points.o prosta.o	

aproksymator.o: makespl.h points.h baza.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c aproksymator.c

interpolator.o: makespl.h points.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c interpolator.c

.PHONY: clean

clean:
	-rm *.o aprox intrp prosta
