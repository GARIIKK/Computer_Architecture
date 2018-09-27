TARGET = hw2
DEPS = sort
DEPS:=$(addsuffix .o,$(DEPS))

CC=gcc
CFLAGS = -lrt -Wall -Wextra

.PHONY: compile clean start

compile: $(TARGET)

$(TARGET):$(DEPS)

	$(CC) $(CFLAGS) -O0 $(addsuffix .c, $(TARGET)) $(DEPS) -o O0
	$(CC) $(CFLAGS) -O1 $(addsuffix .c, $(TARGET)) $(DEPS) -o O1
	$(CC) $(CFLAGS) -O2 $(addsuffix .c, $(TARGET)) $(DEPS) -o O2
	$(CC) $(CFLAGS) -O3 $(addsuffix .c, $(TARGET)) $(DEPS) -o O3
	$(CC) $(CFLAGS) -Os $(addsuffix .c, $(TARGET)) $(DEPS) -o Os

%.o: %.c
	$(CC) $(CFLAGS) -c $<
start:
	./o0 O0
	./hw2 O1
	./hw2 O2
	./hw2 O3
	./hw2 Os

clean:
	@echo Deleting...
	rm -f *.o $(TARGET)