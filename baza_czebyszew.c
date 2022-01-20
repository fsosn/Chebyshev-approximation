#include "baza.h"

#include <stdio.h>
#include <stdlib.h>

/*Baza wielomianów Czebyszewa*/

/* UWAGA: liczbê u¿ywanych f. bazowych mo¿na ustawiæ przez wartoœæ
		  zmiennej œrodowiskowej APPROX_BASE_SIZE
*/

/*
	Funkcje bazowe: 
	n - liczba funkcji
	a,b - granice przedzialu aproksymacji
	i - numer funkcji
	x - wspolrzedna dla ktorej obliczana jest wartosc funkcji
 */

double fi(double a, double b, int n, int i, double x)
{
	if (i < 0)
		exit(-1);

	if (i == 0)
		return 1;

	if (i == 1)
		return x;

	if (i > 1)
		return 2 * x * fi(a, b, n, i - 1, x) - fi(a, b, n, i - 2, x);
}

/* Pierwsza pochodna fi */
double dfi(double a, double b, int n, int i, double x)
{
	if (i == 0)
		return 0;

	if (i == 1)
		return 1;

	if (i > 1)
		return 2 * fi(a, b, n, i - 1, x) + 2 * x * dfi(a, b, n, i - 1, x) - dfi(a, b, n, i - 2, x);
}

/* Druga pochodna fi */
double d2fi(double a, double b, int n, int i, double x)
{
	if (i == 0)
		return 0;

	if (i == 1)
		return 0;

	if (i > 1)
		return 4 * dfi(a, b, n, i - 1, x) + 2 * x * d2fi(a, b, n, i - 1, x) - d2fi(a, b, n, i - 2, x);
}

/* Trzecia pochodna fi */
double d3fi(double a, double b, int n, int i, double x)
{
	if (i == 0)
		return 0;

	if (i == 1)
		return 0;

	if (i > 1)
		return 6 * d2fi(a, b, n, i - 1, x) + 2 * x * d3fi(a, b, n, i - 1, x) - d3fi(a, b, n, i - 2, x);
}