# Configuración de variables
CC=gcc
CFLAGS=-Wall -Wextra -I./include
LDFLAGS=

# Lista de archivos fuente
SRCS=$(wildcard src/*.c)

# Lista de objetos generados
OBJS=$(SRCS:.c=.o)

# Nombre del ejecutable
TARGET=gcj_debian

# Regla para el objetivo principal
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

# Regla para generar archivos objeto
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Regla para limpiar archivos generados
clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: clean
