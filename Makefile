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

# Regla para generar el proyecto de Visual Studio
generate_vs_project:
	mkdir -p vs_project
	cd vs_project && cmake -G "Visual Studio 16 2019" ..
	@echo "Proyecto de Visual Studio generado en el directorio 'vs_project'."
# Lista de archivos fuente Java
JAVA_SRCS=$(wildcard src/*.java)

# Lista de archivos de clase generados
CLASSES=$(JAVA_SRCS:.java=.class)

# Regla para compilar archivos Java
%.class: %.java
	javac -d bin $<

# Regla principal para compilar el proyecto
$(TARGET): $(OBJS) $(CLASSES)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)
