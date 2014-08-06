CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O2 -Wall -g
LDFLAGS = -fno-stack-protector -g

objects	= facseq.o fac.o

default: facseq

.PHONY: default clean

facseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fac.o: fac.s
facseq.o: facseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) facseq

qemu: facseq
	qemu-arm -L /usr/arm-linux-gnueabihf ./facseq
