all: gen fgen

gen:gen.o
	        $(CC) $(LDFLAGS) $^ -o $@

fgen: fgen.o
	        $(CC) $(LDFLAGS) $^ -o $@ -lm

.PHONY: clean

clean:
	rm *.o -f gen fgen
