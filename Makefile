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

# Regla principal para compilar el proyecto
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

# Regla para generar archivos objeto
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Regla para limpiar archivos generados
clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: clean
