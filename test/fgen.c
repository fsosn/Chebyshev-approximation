#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

double rndm(double b)
{
	double a = -b;

	return a + ((double)rand() / (RAND_MAX / (b - a)));
}

double fun(int type, double percent, double x)
{
	percent = percent/100;

	switch (type)
	{
	case 0: //funkcja kwadratowa
		return (3.1 * x * x + 4.3 * x - 2) + percent * rndm(3.1 * x * x + 4.3 * x - 2);
		break;

	case 1: //sinus
		return sin(x) + percent * rndm(sin(x));
		break;

	case 2: //cosinus
		return cos(x) + percent * rndm(cos(x));
		break;

	case 3: //tangens
		return tan(x) + percent * rndm(tan(x));
		break;

	case 4: //x^3
		return x * x * x + percent * rndm(x * x * x);
		break;

	default:
		return x * x + percent * rndm(x * x);
		break;
	}
}

int main(int argc, char** argv)
{
	int n = argc > 1 ? atoi(argv[1]) : 100;
	double a = argc > 2 ? atof(argv[2]) : -3;
	double b = argc > 3 ? atof(argv[3]) : 2;
	double percent = argc > 4 ? atof(argv[4]) : 10;
	int type = argc > 5 ? atoi(argv[5]) : 0;
	FILE* out = argc > 6 ? fopen(argv[6], "w") : stdout;

	srand(argc > 7 ? atoi(argv[7]) : time(NULL));

	int i;
	double dx = (b - a) / (n - 1);

	for (i = 0; i < n; i++)
	{
		fprintf(out, "%g %g\n", a + i * dx, fun(type, percent, a + i * dx));
	}
	fclose(out);

	return 0;
}
